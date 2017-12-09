pragma solidity ^0.4.18;

/**
 * The FoodSafe contract does this and that...
 */
contract FoodSafe {
	struct Location {
		string Name;
		uint LocationId;
		uint PreviousLocationId;
		uint TimeStamp;
		string Secret;
	}

	mapping(uint => Location) Trail;
	uint8 TrailCount = 0;

	function AddLocation(uint LocationId, string Name, string Secret){
		Location memory newLocation;
		newLocation.Name = Name;
		newLocation.LocationId = LocationId;
		newLocation.Secret = Secret;
		newLocation.TimeStamp = now;

		if (TrailCount != 0){
			newLocation.PreviousLocationId = Trail[TrailCount].LocationId;
		}
		
		Trail[TrailCount] = newLocation;
		TrailCount++;
	}

	function GetTrailCount() returns(uint8){
		return TrailCount;
	}

	function GetLocation(uint8 TrailNo) returns (string, uint , uint, uint, string){
		return (Trail[TrailNo].Name, Trail[TrailNo].LocationId, Trail[TrailNo].PreviousLocationId, Trail[TrailNo].TimeStamp, Trail[TrailNo].Secret);
	}
	
}