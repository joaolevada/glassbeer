alter table TAccountChart
  drop column Balance,
  add column Balance money;
  
alter table TEquipment
  drop column Cost,
  add column Cost money;
  
update glassconfig set dbversion = 7;