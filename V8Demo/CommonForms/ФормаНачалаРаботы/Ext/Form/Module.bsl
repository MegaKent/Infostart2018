﻿
/////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Examples for the report "Making external components for 1C mobile platform for Android""
// at the conference INFOSTART 2018 EVENT EDUCATION https://event.infostart.ru/2018/
//
// Sample 1: Delay in code
// Sample 2: Getting device information
// Sample 3: Device blocking: receiving external event about changing of sceen
//
// Copyright: Igor Kisil 2018
//
/////////////////////////////////////////////////////////////////////////////////////////////////////

&НаКлиенте
Перем Компонента;

#Область СобытияФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	счетчик = 0;
	Если ПодключитьВнешнююКомпоненту("ОбщийМакет.Компонента", "Demo", ТипВнешнейКомпоненты.Native) Тогда
		Компонента = Новый("AddIn.Demo.Infostart2018");
		Устройство = Компонента.ОписаниеУстройства;
	Иначе
		Оп = Новый ОписаниеОповещения("ОбработкаЗавершениеРаботы",ОбщегоНазначенияКлиент.ЭтотОбъект,Новый Структура("БылаОшибка",Истина));
		ПоказатьПредупреждение(Оп,НСтр("ru = 'Не удалось подключить внешнюю компоненту'"),10);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ВнешнееСобытие(Источник, Событие, Данные)
	Если Источник = "ru.infostart.education" и Событие = "LockChanged" Тогда
		ПоказатьПредупреждение(,"Экран разблокирован",5);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область СобытияЭлементов

&НаКлиенте
Процедура КонтрольБлокировкиПриИзменении(Элемент)
	Компонента.Экран = КонтрольБлокировки;
КонецПроцедуры

#КонецОбласти

#Область КомандыФормы

&НаКлиенте
Процедура ЗадержкаВыполнения(Команда)
	Если ПроверитьЗаполнение() Тогда
		Компонента.Пауза(ВремяЗадержки);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти
