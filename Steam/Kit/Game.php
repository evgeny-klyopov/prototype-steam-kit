<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 22.07.2017
 * Time: 18:46
 */

namespace Steam\Kit;


/**
 *
 * Interface Game
 * @package Steam\Kit
 */
interface Game
{
    /**
     * Получение информации о стоимости игры
     * https://wiki.teamfortress.com/wiki/WebAPI/GetAssetPrices
     * @param int $appId        - Идентификатор приложения в стиме
     * @return array $price     - Массив с ценами о игре
     * $price = [
     *      'original_prices' => [
     *          'USD' => 99,
     *          'GBP' => 59,
     *          'EUR" => 74,
     *          'RUB' => 3000
     *      ],
     *      'price' => [
     *          'USD' => 249,
     *          'GBP' => 199,
     *          'EUR' => 199,
     *          'RUB' => 7400
     *      ]
     * ];
     */
    public function getPrice(int $appId): array;
}
