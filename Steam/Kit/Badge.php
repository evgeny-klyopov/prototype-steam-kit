<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 21:50
 */

namespace Steam\Kit;


interface Badge
{
    public function getCards(int $gameCardId): array;
}