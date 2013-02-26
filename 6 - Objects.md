# Objects

## Properties
	* Color
	* Smell
	* Make
	* Model
	* WheelCondition(0-5)
	* BodyType
	* EngineDisplacement
	* EngineCylinders
	* FuelLevel
	* LowFuelLamp
	* Cleanliness
	* BodyCondition
	* TirePressure
	* Velocity['speed|direction']
	* Location['lat|long|alt']
	* NumPassengers

## Methods
	* Wash()
	* TuneUp(serviceType) - one of OilChange, SparkPlugChange, TransFluidChange
	* ChangeIgnitionStatus(status) - one of off, acc, on, start
	* Accelerate(speed,direction) - speed can be negative
	* ShiftGears(gear)
	* Refuel(fuelAmount)
	* WindowChange(window,height)
	* Wiper(placement,speed)
	* LightingToggle(light)
	* Crash()
	* CallOnstar()

## Events
	* MIL (check engine light)
	* FuelWarning
	* DoorAjar(e.door)
	* Crash
	* AirbagsDeployed
	* MaintenanceIndicator

## Inheritance
	* Genes passed down to descendants
	* e.g. Opacity, position context, font-size

## Propagation
	* Events are propagated to ancestors
	
