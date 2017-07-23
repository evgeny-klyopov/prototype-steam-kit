<?php

namespace Steam\Kit;


/**
 * Получение информации о вещах на торговой площадке
 * Interface Item
 * @package Steam\Kit
 */
interface Item
{
    /**
     * Получение информации о минимальной и средней вещи на торговой площадке
     * https://wiki.teamfortress.com/wiki/WebAPI/GetAssetPrices
     * @param int $appId                - Идентификатор приложения в стиме
     * @param string $marketHashName    - Алиас вещи на торговой площадке
     * @return array $price             - Массив с ценами о вещах, в долларах
     * $price = [
     *      'lowest_price' => [
     *          'USD' => 99,
     *          'GBP' => 59,
     *          'EUR" => 74,
     *          'RUB' => 3000
     *      ],
     *      'median_price' => [
     *          'USD' => 249,
     *          'GBP' => 199,
     *          'EUR' => 199,
     *          'RUB' => 7400
     *      ]
     * ];
     */
    public function getPrice(int $appId, string $marketHashName): array;
}