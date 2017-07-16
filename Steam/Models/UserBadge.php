<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 20:48
 */

namespace Steam\Models;


/**
 * Interface UserBadge
 * Интерфейс для работы с таблицой steam_user_badge
 * @package Steam\Models
 */
interface UserBadge
{
    /**
     * Обновление значков пользователя
     * Обновление происходит в два этапа:
     * - делаем insert on duplicate key (благодаря ключу steamId64_gameCardId_unique, в таблице steam_user_badge),
     * обновляем dateUpdate (через переменную @dateUpdate = date('Y-m-d H:i:s');, чтобы у всех обновленных данных
     * было одинаковое время обновление) и level
     * - удаляем старые данные у которых dateUpdate != @dateUpdate, то есть те которые мы не обновили
     * в предыдущем запросе
     * @param int $steamId64    - Идентификатор steamId64
     * @param array $badges     - Массив значков, (new \Steam\Kit\User())->getBadges()
     * @return bool             - Флаг обновления, true - успешное обновление
     */
    public function updateBySteamId64(int $steamId64, array $badges): bool;
}