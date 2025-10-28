export interface IModelResponse {
  id: number;
  name: string;
  brand_id: number;
  year_start: number;
  year_end: number | null;
  createdAt: Date;
  updatedAt: Date;
}


export interface IAttrsDb {
  capacity: number;
  horse_power: number;
  transmission_type: string;
  drive_type: string;
}

export interface IBTypeResponse {
  id: number;
  name: string;
}

export interface ITrimResponse {
  id: number;
  name: string;
  attributes: IAttrsDb[]
}