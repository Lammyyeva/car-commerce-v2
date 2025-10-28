export interface ICityResponse {
  id: number;
  name: string;
  parent_id: number | null;
  createdAt: Date;
  updatedAt: Date;
}
