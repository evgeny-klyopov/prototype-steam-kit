<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 19:57
 */

namespace Steam\Models;


/**
 * Interface Item
 * Интерфейс для обновления вещей на торговой площадке
 * @package Steam\Models
 */
interface Item
{
    /**
     * Обновление вещей
     * Обновление происходит в два этапа:
     * - делаем insert on duplicate key (благодаря ключу appId_marketHashName_unique, в таблице steam_item),
     * обновляем dateUpdate (через переменную @dateUpdate = date('Y-m-d H:i:s');, чтобы у всех обновленных данных
     *  было одинаковое время обновление), medianPrice и lowestPrice
     * - удаляем старые данные у которых dateUpdate != @dateUpdate, то есть те которые мы не обновили в предыдущем запросе
     * @param int $appId                - Идентификатор приложения в стиме
     * @param string $marketHashName    - Алиас вещи на торговой площадке
     * @param array $price              - Массив с ценами о вещах, в долларах
     * @return bool                     - Флаг обновления, true - успешное обновление
     */
    public function insertOnUpdate(int $appId, string $marketHashName, array $price): bool;
}