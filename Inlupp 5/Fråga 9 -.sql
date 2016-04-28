SELECT XMLQUERY('element Resulat {
                for $l in distinct-values(ora:view("Book")//ORIGINALLANGUAGE/text())
                let $count := count(ora:view("Book")//ORIGINALLANGUAGE[text() = $l])
                return element Spr�k{attribute namn{$l}, attribute antalb�cker{$count}}
                }'
                RETURNING CONTENT)
FROM DUAL