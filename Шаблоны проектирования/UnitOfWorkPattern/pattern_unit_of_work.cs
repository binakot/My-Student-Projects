public class UnitOfWork {

    private List<DomainObject> newObjects; 
    private List<DomainObject> updatedObjects;
    private List<DomainObject> deletedObjects;
    
    /**
     * Создать объект
     * @return вернуть вновь созданный объект
     */
    public DomainObject create() {
        DomainObject domainObject = new DomainObject();
        newObjects.add(domainObject);
        return domainObject;
    }
    
    /**
     * Пометить объект как измененный
     * @param domainObject измененный объект
     */
    public void update(DomainObject domainObject) {
        updatedObjects.add(domainObject);
    }
    
    /**
     * Пометить объект как удалённый
     * @param domainObject удалённый объект
     */
    public void remove(DomainObject domainObject) {
        deletedObjects.add(domainObject);
    }
    
    /**
     * Выполнить изменения в базе данных
     */
    public void commit() {
        //выполняет SQL запросы на вставку данных INSERT
        insert(newObjects);
        //выполняет SQL запросы на обновление данных UPDATE
        udpate(updatedObjects);
        //выполняет SQL запросы на удаление данных DELETE
        delete(deletedObjects);
    }

//реализация методов insert, update, delete и прочих

}