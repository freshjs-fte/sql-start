SELECT 
  birthday, 
  (
      /* SWITCH */
    CASE extract('year' from age(birthday))
      WHEN 25 THEN 'Проходите пожалуйста'

      WHEN 18 THEN 'Проходите'

      ELSE 'Не проходите'
    END
  ) AS over_18,
  (
      /* IF */
    CASE 
      WHEN extract('month' from birthday) > 11 THEN true

      ELSE false
    END
  ) AS is_winter
FROM users;

/* 
    Колонка акция
Для телефонов марки Хонор - 15 %
Для марки Айфон 10 %
Для остальных 3%

Показать
id, brand, sale
 */
SELECT 
id,
brand,
(
   CASE brand
    WHEN 'Honor' THEN '-15%'
    WHEN 'IPhone' THEN '-10%'
    ELSE '-3%'
   END 
) AS sale
FROM phones;

