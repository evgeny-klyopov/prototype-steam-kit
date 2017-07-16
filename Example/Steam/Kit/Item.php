<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 19:52
 */

namespace Example\Steam\Kit;


class Item implements \Steam\Kit\Item
{
    public function getPrice(int $appId, string $marketHashName): array
    {
        // TODO: Implement getPrice() method.
        return [
            'lowestPrice' => 12.11,
            'medianPrice' => 13.11
        ];
    }
}