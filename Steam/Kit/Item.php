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
     *      'lowestPrice' => @lowestPrice,
     *      'medianPrice' => @medianPrice
     * ];
     */
    public function getPrice(int $appId, string $marketHashName): array;
}