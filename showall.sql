SELECT
    e.*,
    h.*,
    o.*,
    s.*,
    en.*,
    hu.*
FROM
    "s333714".""Emotion_status" AS e
        LEFT JOIN
    "s333714"."Health_status" AS h ON e."emotion_id" = h."health_id"
        LEFT JOIN
    "s333714"."Observers" AS o ON h."health_id" = o."creature_id"
        LEFT JOIN
    "s333714"."Status" AS s ON o."group_id" = s."emotion_id"
        LEFT JOIN
    "s333714"."Entity" AS en ON s."status_id" = en."status_id"
        LEFT JOIN
    "s333714"."Humans" AS hu ON en."entity_id" = hu."human_id";

SELECT "human_id" FROM "s333714"."Humans" AS "h"
JOIN "s333714"."Status" ON h.human_id == human_id
;

SELECT "h"."name"
FROM "s333714"."Humans" AS "h"
         JOIN "s333714"."Status" AS "s" ON "h"."status_id" = "s"."status_id"
         JOIN "s333714"."Entity" AS "e" ON "s"."status_id" = "e"."status_id"
         JOIN "s333714"."Health_status" AS "h" ON "s"."emotion_id" = "h"."health_id"
         JOIN "s333714"."Emotion_status" AS "em" ON "s"."status_id" = "em"."emotion_id"
WHERE "e"."name" LIKE '%*%'
  AND "h".description == 'Биться в агонии'
  AND "em".description == 'Восхищение';