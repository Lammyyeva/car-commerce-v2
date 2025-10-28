export interface IBrandResponse {
  id: number;
  name: string;
  image_url: string;
  models: IModelDetail[];
  createdAt: Date;
  updatedAt: Date;
}

export interface IModelResponseDetail{
  id: number;
  name: string;
  yearStart: number;
  yearEnd: number | null;
}

export interface IModelDetail{
  id: number;
  name: string;
  year_start: number;
  year_end: number | null;
}