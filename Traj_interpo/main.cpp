#include<stdio.h>
#include "Quintic_Spline.h"
#include "Cubic_Spline.h"
#include "Collision_Check.h"

int main()
{
	printf("helloworld\n");
	int time = 8;//��λs
	float trajpoints[500][4] = { 0 };//���֧��500����
	/********2points*********/
	float start_degree = 0;//��λ��
	float end_degree = 50;//��λ��
	float start_velocity = 0;//��λ��/s
	float end_velocity = 0;//��λ��/s
	bool Traj_Cubic_2points;
	/*******manypoints*******/
	bool Traj_Cubic_manypoints;
	bool Traj_Quintic_manypoints;
	float degree_array[5] = { 0, 10, 20, 30, 40};//��λ��
	float velocity_array[5] = { 0, 2, 2, 2, 0 };//��λ��/s
	float acceleration_array[5] = { 0, 3, 3, 3, 0 };
	unsigned long long array_num = sizeof(degree_array) / sizeof(float);//�켣��ĸ���

	//CubicSpline traj;
	Collision_Check Col_check;
	QuinticSpline traj;
	/*****************���ζ���ʽ�����滮�켣*****************/
	/*Traj_Cubic_2points = traj.getTraj_Cubic_2points(time, start_degree, end_degree, start_velocity, end_velocity, *trajpoints);
	if (Traj_Cubic_2points == false)
		printf("Error:trajectory points need to be less than 500!\n");
	else if (Traj_Cubic_2points == true)
	{
	    printf("The trajectory from %f��to %f�� is:\n",start_degree,end_degree);

		for (int t = 0; t <= time * 10; t++)
		{
			printf("Time:%f		degree:%f	velocity:%f		accel:%f\n", trajpoints[t][0], trajpoints[t][1], trajpoints[t][2], trajpoints[t][3]);
		}
	}*/
/****************���ζ���ʽ�����֮��滮�켣*********************/
	/*Traj_Cubic_manypoints = traj.getTraj_Cubic_manypoints(time, degree_array, velocity_array, *trajpoints, array_num);
	if (Traj_Cubic_manypoints == false)
		printf("Error:trajectory points need to be less than 500!\n");
	else if (Traj_Cubic_manypoints == true)
	{
		printf("The trajectory between %d points is:\n",array_num);

		for (int t = 0; t < time * 10; t++)
		{
			printf("Time:%f		degree:%f	velocity:%f		accel:%f\n", trajpoints[t][0], trajpoints[t][1], trajpoints[t][2], trajpoints[t][3]);
		}
	}*/

	/************��ζ���ʽ���֮��켣�滮************/
	Traj_Quintic_manypoints = traj.getTraj_Quintic_manypoints(time, degree_array, velocity_array, acceleration_array, *trajpoints, array_num);
	if (Traj_Quintic_manypoints == false)
		printf("Error:trajectory points need to be less than 500!\n");
	else if (Traj_Quintic_manypoints == true)
	{
		printf("The trajectory between %d points is:\n", array_num);

		for (int t = 0; t < time * 10; t++)
		{
			printf("Time:%f		degree:%f	velocity:%f		accel:%f\n", trajpoints[t][0], trajpoints[t][1], trajpoints[t][2], trajpoints[t][3]);
		}
	}
}