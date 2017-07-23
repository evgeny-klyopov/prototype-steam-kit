<?php

namespace Steam\Models;


/**
 * Interface SteamInventory
 * Интерфейс для работы с таблицой steam_user_inventory
 * @package Models
 */
interface UserInventory
{
    /**
     * Обновление инвентаря пользователя
     * Обновление происходит в два этапа:
     * - делаем insert on duplicate key (благодаря ключу steamId64_steamItemId_unique, в таблице steam_user_inventory),
     * обновляем dateUpdate (через переменную @dateUpdate = date('Y-m-d H:i:s');, чтобы у всех обновленных данных
     * было одинаковое время обновление) и quantity
     * - удаляем старые данные у которых dateUpdate != @dateUpdate, то есть те которые мы не обновили
     * в предыдущем запросе
     * @param int $steamId64    - Идентификатор steamId64
     * @param array $inventory  - Массив вещей, (new \Steam\Kit\User())->getInventoryBySteamId64()
     * @return bool             - Флаг обновления, true - успешное обновление
     */
    public function insertOrUpdateBySteamId64(int $steamId64, array $inventory): bool;
}