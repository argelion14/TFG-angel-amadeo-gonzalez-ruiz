# Generated by Django 3.2.14 on 2022-11-04 19:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ori', '0015_auto_20221104_1415'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='timesheet',
            unique_together={('rol', 'periodo')},
        ),
    ]