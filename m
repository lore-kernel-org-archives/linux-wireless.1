Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080234;
	b=BAuBK+2Eo5v1BSnXH3vXNRw9dJHkByxW9eJS2boScFFPe8NNyX79wVITZY3PnAc+v5jC
	 K9PO5CKjjuFUrpnNauY4NICBJ9OBDm4lJsOc5oPjDSVr8S0XwHgiZJ0lCrv21KxE9d1nR
	 o//BngauKnYa3earVIJMziivlJfOdiFbkzESayn+06oPT6rSBfxabaO+ighH8itEIoVnT
	 OPuG22S+4FW4PXHPx8ud1SvNHkkvTrngyMR7d46Xz1o/JW8m9gK1NOz87vOirc7SHNgi5
	 H0Oif35Axc3hjU7WEUpjMYE4GWl1YyM842JIVaWAxB9VZr1ntYh7e8FdsxWLg3NNv+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-MS-Exchange-CrossPremises-AuthSource:
	 X-MS-Exchange-CrossPremises-AuthAs:
	 X-MS-Exchange-CrossPremises-AuthMechanism:
	 X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
	 X-MS-Exchange-CrossPremises-MessageSource:
	 X-MS-Exchange-CrossPremises-BCC:
	 X-MS-Exchange-CrossPremises-OriginalClientIPAddress:
	 X-MS-Exchange-CrossPremises-TransportTrafficType:
	 X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	 X-MS-Exchange-CrossPremises-SCL:
	 X-MS-Exchange-CrossPremises-Processed-By-Journaling:
	 X-OrganizationHeadersPreserved:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=eSOkzvHvLkZlOkjNS5gKigfq3xQy7ScxxB1Ud4OJl3Q=;
	b=A6eHK8b8kP/304OsE7HVoKcblN9TY3YvLHDHrYWq+g5LlK/lz/TiApV5o4AeNcCbGU4Z
	 n0doFlrOLZJ+9xEN7RQDdOSg7f4EJTF1Cqcvwjl66gVWfoUWCR9KoEz/vC/+niJD2EFIS
	 LPi25tAQxLjnDbl8pofDsS6mnPybxwl4iMEUUrbQa5LzTE+XKDjrBc2/AL9Iy5ywHLarX
	 Ji4gAAMa/cTQoCRXZUNTcduQeeGw1H6xPWmaOpaJk+OpzJPGlQwd1xXYwA+J3C0tks3ma
	 pbaTj8SLOtEJXpqZ/9Bco7ZSKusc8/jfZjCxVtf5dwyv4VcSB0nSbImXNS/kcMlT8kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=westermo.com;
	spf=pass smtp.mailfrom=westermo.com;
	dkim=pass header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=rqlJcjNZ;
	dkim=pass header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=Kzx6XCuA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.184.10
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BED606A324
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=rqlJcjNZ;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=Kzx6XCuA
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6veSI459461;
	Thu, 19 Nov 2026 10:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	eSOkzvHvLkZlOkjNS5gKigfq3xQy7ScxxB1Ud4OJl3Q=; b=rqlJcjNZP4qw2uVK
	CJv1FbdxFaHheUUtaDxa73+iLsbU6T6HZAfj1fRmoAJzlePvQ5zQ3w4xGpDO+EDv
	2ToDmqleIGN8vDSOTad217GDFSaLz3En5odqTiPa6fpFXRxtTaN4Hccpb2vNPTSN
	wYPHyZivt4Ya0ndZuWfmSGJFf+u1XT3uKvEMJbkePaPgF06V+ciJAC0YND6Au23l
	QuJqcfzIy+1Ke2ZPAvy488xu+1iUIQ/zM5w1uULBRjYqRHv1sziZ7LgFMOY1ePgb
	CKVAcJQTqNebhOomvSTbilKFPYNwl1rtH1CuVlisEk41Ngt0340Rk7S9Ai3m4m/K
	hPPkFA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022112.outbound.protection.outlook.com [52.101.66.112])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgdfc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZGG4hae9/qRqlIcqundFK7PupDAJALvdl7+BhNmxp0KkNoCAo8jz5cjQgAi2I4fW7vjG8QL2A96rvTaxjQvC3SN4CGhem68W5L1sKiX7v2D0BWpMQDQC3D+/KLASZDLT+f003Ffx6Tj9eMO5PPkKKEcuNYMHlVLvGKzmkqihBSCf93MuHYUrd5ZmzzYNbigqUVSegjuQFpjDo+0x1kIsT8OUoRWhBls0fgvqqunEsBoPMkOyV3GaG9ah6e3ngRoWXxom/rL8YYBe8soQt5gEXawIjgoGyNYZKiCJGrrZqFbq1bP5fp0RYsJL2zG0RRSLmVzSpAZsSjqpMZbUzDAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSOkzvHvLkZlOkjNS5gKigfq3xQy7ScxxB1Ud4OJl3Q=;
 b=XiRKsjHpgb7DP+zu/ULnd8gHI42f/CYKw5dkNDNpIJ36RE+FiG3y+Kclwy0Qpb1k3Q2PYuJZBSFlLUHI+9uVtwZF7WH/EqegADvdJdByCS3i0uhybIfXH6WBlLN88UhOLlBEaT7N38PKx4U9tr6BAJWKWj6Xw98x3SiCypGJ27ydDnKXYoTdjRhBTPrIIAcWiOysuuOOACaJlvmZJtgOD5qjSGgeiNOiFAD5HiFDc5WyOcdHUs1QiJDW7B58/pA4+rZscNxuYcIwc716wXLFEDprnEggTPWUnENHQAnLK2Hl8rVHlO8ZvtZMNTQ5iRgCK0X+Jj2wan0Tc0+fafj21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSOkzvHvLkZlOkjNS5gKigfq3xQy7ScxxB1Ud4OJl3Q=;
 b=Kzx6XCuASGsnuIxzxZtkbN1Sm+3lZ+UEpbNVURO0Zm9nXroqp39yt6WYY0dIXet6GfHRHejAeD+nThhOqy8SF4wR+9Ijc/VyVVMCnvfMl7Txs1yGRQsu1qb+wWU8dSQ3r6nrFns2iyEstUMDWjDe7bwmgEB7QYeZT87Z6BOqP4c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:38 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:38 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Subject: [PATCH RFC 0/7] wifi: ath11k: support big endian hosts
Date: Thu, 19 Nov 2026 10:17:52 +0100
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBA0auUWTvQSbBYt4IH6FZcpHbSDEISM
 lGE0rsbunyb/zdQLsIK126Dwl9RSbGBTh28gosroyzNYHozENGIrgaiN+on51QqzrIix0VcxJC
 0Ko7e0mWwpvdnC62SC3v5HYcHTPcbPPf9D4E3m5V2AAAA
X-Change-ID: 20261119-ath11k-support-big-endian-hosts-9f3186320f53
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS6P279CA0142.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::16) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 00515112-a871-4912-d071-08df461ecafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|260925021911599003|261026121527099003|11063799006|56012099006|260925022911599003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|260925021311599003|261022075727099003|261028144727099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pc8HciRS70/FMPUdibPc6yCyqBzZMV8oFSrMlTBxbNCVFtmUVOzVeYED0503wtPujBZJw/PDGz/EPc7lz2FVPa4s0U4NMSAursC1O7Ei1mClBW673LtYIhniDpAuVgkQfhYLXP72rxtJltEM7iaspUaO9+kzluaFJI+q5ydnHsGcg9olE8QWXBGlpzNheWf8Rj6OwhaxCJmnhWWlVkssWau9pKjZElA2tLuZ+2K6ie5VcBD3CS4crrLNUcla3AOQm0GO0wWJOn2yUa9s6LjRRV2EJT94cvYinLJIMnpm7Wnde+r4sUfEq0cADer3+IXhrpy7czR3nEj9TPY2SdbihZLivVTfBqnPIE5s/6kGfseWAAIYxMEwJFM91k6M0OXfvhSg8mQklP1ZEa1qgEcnOvvaJ7IsuqRVO9kZFjbBd/J9/7284IF2ktHmDn7mmPvPzGa/bhNBgJkfCvEHjuggQQRRzMCwL9IASoAvIo4nRyzxKJ7T/vK0WzD/3je3sto4lPYXNlUsiH5v/75TsAKkdPIDn37AoRujsw/E9rzrqJOLqCTCZnHo4UnKrQfktHZoPaI+l+BpvrM+5gYaAuFZvsCx+thKZ4zX4Vu4RwV8N7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(260925021911599003)(261026121527099003)(11063799006)(56012099006)(260925022911599003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(260925021311599003)(261022075727099003)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2o2bDRodGVERTluVU1NRE16bzl4WG1GQW1EdWJsWU9tZElpOEI2ZFI5RDNJ?=
 =?utf-8?B?U0RtMjlhbFR1WnlseTJsZkdWQWdCdFBLQXR1VXd6akhoZXlEQmsyN2JQb1kx?=
 =?utf-8?B?Rk5JaTBvSGQxcHh3UVd5R0F6YVRnTFlrdUJIQ01CSnRWVGRQVVNRV081M3B4?=
 =?utf-8?B?VmpFZGxzdlR2N1hiT3U0R0VrNGVvdmIrYnBjelgvMGtHWjI2VytUYXFOdFJS?=
 =?utf-8?B?ZStLYzgxYTJqVXNreUltQ2ZCN1gvYkpQTjkvdjNySkpjWUUwOWpsYUNWU1BT?=
 =?utf-8?B?ekdyUW9vZEFZd2FzTXB0ckpzN0JZcHY1TGd1K29sV2JydVJOTnZPVkFxbGdC?=
 =?utf-8?B?RksvZkJlRTRVbVc4VXlMcStjTTJGNlpKVkhUMHpyR2FmYnJsd21icjVwbHVH?=
 =?utf-8?B?NFRmbFd4MldPd3JRY3EwYWsvRlg3WlJZbGk3dHdEbUk5eG13VExQOUtoWHVL?=
 =?utf-8?B?UmViSDFJS1JuMTlCUjdOcWlXQ1ZVelplV1pja28yOGpLMmYraXJvOWZkYzQ0?=
 =?utf-8?B?eCtHZFdZRG5saUJHaUhwT21GOHpVeTBmeXNvYklNZ0RFQ2d6bmtUekcwTUdj?=
 =?utf-8?B?VFJvUU5SSXNLZGhaYnNRZmZDakllaE11b1o5aWhISEFvZmxubktCa3VZM2xl?=
 =?utf-8?B?NHhlT2cwRzJuU0ZpSjJ5Q09CWndXZEdFYnN3UllEanVaZmlyNlNaMDZOSkU4?=
 =?utf-8?B?dEluOFZ0ZmlOTnNzdnpHVGZNRlNMQ2VVY1FONVYvM0R3QkpGdzk5VGpoUGFV?=
 =?utf-8?B?SnNwWVdrNjUzYTdkUkRxUzlZM1pyZHVtUjI0YjFkajByWFdFRGxKekZKa3FP?=
 =?utf-8?B?U1RhTDczSTZRclZFWlhoRXB5QkYveTdQU242WkJIRUZYZlpPZlFJWURkRVJx?=
 =?utf-8?B?SVgzclRidnVyQW1vamlURDF0RFpiYUhtU2tSUzN5RWlGZysxNE04MmlaaUVt?=
 =?utf-8?B?UUZacUZyc3JETnpaNWdZVHlOSkU5RnR6UGMraWZtb2F0SWkzdStOamR3eW5x?=
 =?utf-8?B?akl2M2FiUjZZUngxYXk3MmpDNjNlSkF1WVJjOXQwRzlTMEFKUldOd1RLRFZI?=
 =?utf-8?B?Q0d3YlE3OGYrdFR2SzJpRTFZOWpPVGNwZmJjSHdvR29oSFJ3SGdFTlZRM1py?=
 =?utf-8?B?V05jQS92aUd4MU1FVTI2bXo5SkovWlNzRVFORTk3ZFBRQmtFOWtGZGFVZGRZ?=
 =?utf-8?B?bTM5MncxWlV6YWFXelN4TU8zd2ZtM0Jod2hsTjM3VXVYMG1GMHJJMTdtUitx?=
 =?utf-8?B?WitGY000ck1kWURNRGVhME1PT3Y4TklLTVZ4alR3TTJzUkNuN3cySWFVdzFt?=
 =?utf-8?B?K3hBckpidWVldjZNdEJHTWpNMjBHV09mYlpMdW9aYVdjUzBxMXVZcldETmd4?=
 =?utf-8?B?dUFKdHJxditYN3YyaEV0NEk4U0ZmRDgzTXc4YWxzVkZMV0JYTFZGeVAzZE9B?=
 =?utf-8?B?V2U3U3NOMGpTbUFYUEQzWUlBOGczc1k2Z0xMQlYxL1RDSEEvV0tRZXk0dUY2?=
 =?utf-8?B?Zlg2U0p6dkRWSWNqRituU25kYWlEckJwemtQNngra3IvZTdlOXUwYzNXNmdI?=
 =?utf-8?B?RmtPNUdWYTFIYzFwUTZ1SnpwWHpVR0JhdUJPRWhsTmZnMFo4NnFpeUJ1WGtX?=
 =?utf-8?B?UlpUVFVwODlXclkrejBVQ1FTNU5ueXhaU1lQQnNmZVFSZm1XNTFWU1Jva00w?=
 =?utf-8?B?bzFiR3hxWU1TYnlZd2oybm1IZVBUaWp0OXduVExDbUJJNENxRHNiSWFSUjBz?=
 =?utf-8?B?TC9rNWNxV3VheHBlWDFSWWpKUnFvb0s2Yi90OFdQSXFRajdGTzY2emxvbTNa?=
 =?utf-8?B?cUhvbThVRFBqOVpNR2N3WFBiNmVvMG9iTlhKZUNtTzkyS3FIYkpVWWk4SEtV?=
 =?utf-8?B?TmVIbU5NVUZMQTRCN3d5b1pqTjgrTm9HRFA1Q2ZyM3UvaUZWbnRxOG9OVFdM?=
 =?utf-8?B?WE9Yd0d5YzJSOXgxUVZieFcwK0ZqVUY0dHMvMlRZYUdDSEZUNjZIYWw1cjBY?=
 =?utf-8?B?aU00S3d5NDBuZ01KNGpXMTFxcHZXSE9zc3JIZ3R4cHpieWxjMEcyNCtIVTNH?=
 =?utf-8?B?NjF5akg4ZTlCSjJZb3NPZ2o1eWdMaGJ1RGdublVNZnd2ZUJtSlJ6YzZWdFIv?=
 =?utf-8?B?S2NSRGh0U2M0TmZsZWhscDBzUnd3NXR3SERvbThlRTNjeHNObnFEMjRKWEpz?=
 =?utf-8?B?a2l1WlY3Mm5XZXdPTmZQZVRnQkhXZ3RiNnVUTnNPZUovVXpMRTRnTEJBQ25Y?=
 =?utf-8?B?NE9NMXZYSDd4M1VnNjV2YWRhQWZuRVJROExaVnNXM09VeUNoaW1GZmg4U2VJ?=
 =?utf-8?B?SnA3MkZFWUJXNHYwaHVBNDNyY1VNVXd5MCtSYjdiUnNubVo0bE4wZz09?=
X-Exchange-RoutingPolicyChecked:
	keJ6PGKKtQ9XfLk1ur0ERl2qUjgxefOyHOk1Y9aXcELdRrzABiOnLe/yzdBXiJ/cnIW8tNoxQ5XhjdNXOFBMVsPMlHcArnKDOp8/PzR/H0RYdzW/ba+1s9bXN4uBntYZWBw/3nCTQkj1v1PNzXGR6tUnv6c6SxFZl9QyxvRR8s/fTDKkXTCx7s+K+6ChU8nKvoppbr9Y4Yw2Qe7Vb2dK/NBbtHNCN0q/dfzR52yIwu4jRRyP+aNLPbeiyNhaZzlUKYS7Y9ssj6BC7YV5X//82ewXg27vfMkcvL5/+N4caNGpy/MX3oVoCgwjLAeypqkw1QGw5lwToc/QxYyaB+zbXg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0O0TYaz0lKAb38UXcIAJ/lSZh88eDfjFCCsWo+oMFRb+NOH07N6xiauBTTpB0tKpdShp0wHvGLXRQXGoFFCRYdESKMASAyFehfNfyFpbNc5Ijenp/kj4woToeu2zX9IAaPugmD7FfH9694hBkVF/H05Q+o45vHMjqEB7pJ0pVcluUWvrhpCD+1VxWOK1iAZgcbAj/WjvAVPNA7jO6U8lwAob2FxUYDasv0zaTYlkghGty9fDZD9r2Z3UuixnV9sp597SusaSCMSBWKJ3xMSeLIf82X1tEu/8z1rR1ijlHFGABIObGTPkKc3/Ejl2kOdUAHG4gQsdFZUDBa4t9Tg37cr1gfIgC64qrl7FfJtukUVhCmKh1E/8FqXBoj5U0rexCEFnTQGtPbRPpZcXtDsnsc+RUoLHDXqFyVm5d6P80t3iDejEp8wtEJ8qwWcAf17dGLfj494i6XV55ZrFa/3mlHAzSzu98RV29xYIYkgqCtBnNcUt8hpwQPW0Z4xq1BrkGcNJgkJn+YDi7Tfn8/D1K80sT6lqnRn0VZCKS2qBVeZ+kkIkQ3TrPMCt0FftBMzAF3tLMmj/GW7pflc7r4DdmvergaK20nAz1Lm/AR93yGIKtIU2rj8usEZOE6ZK6l/m
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00515112-a871-4912-d071-08df461ecafd
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:37.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMcmdeyG0dOo/gJVfxvHiw6OX8gwxL2RlkTTyGe0DUqFGNsCLgCiOVJAdSGDILbadYvKpve1cfWXU/yMxKD78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0893
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0893.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: SdVqk4UIsZSEKkkn898J-m5ytxOYXfhU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfXzikWmqKtK3iw
 GmVHKSSgqyKBoV+vT5EKuGH0TEr35dSYte1HCLTFJVCoNsGb1T/8ZP7cf3A/TJbO4kqSBHUQySw
 PZl6Jq4SQELHjkWsRDUken9Wz/2J8B8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX0EYRIeBNvyZB
 tr7vVW2EB4zEAmMf3lht0dgIs8NCylkE67sizr6aipVVYc45aV/gTWy7MhdWgq0nUfhf1B2mpFR
 k00ho0CV0zqOmT7zcyzrHk0mipzVncaF/+EXz92mpLvw6aRAeZaMa2n9irYd4+2ViweetGgaoPm
 HOQZkrjre0r2PQA3Xd92jZcez3zxGJbLMpAk/yeEQk0peHncleRp00k/TGj5hkXwEPXFidPA3py
 /knwnYsAA/qQXQH+XzUGtmyIpzVwFU4zsJfdUNSqdl0d5QAfpPMs9XXuSGv2GIkNtYvAH+GyqGj
 pWQz50z1Fuya2t312schfcmDUn9Fpv9XMfhFXTGOrmU9xyF6OCub+LY3G2mqr9qkOLx6jqG+xB+
 F8RXd3vXSSemyjmBy5Nt2WmhyQt0XA0qaALiBzJtJMDyjnCJq94AtT8onc84hIObPDiLOLc2+6i
 mBP/dfHkMb2OKZ3k2ZA==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afec01e cx=c_pps
 a=yfNaQ/2DOX43yGgd4xgpDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=wzxbn169AbrpDypWWU0A:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: SdVqk4UIsZSEKkkn898J-m5ytxOYXfhU

This RFC series follows up on the discussion in [1]. It moves all byte
swapping for big endian hosts from the target into the ath11k host driver,
the same approach ath12k already uses.

Today ath11k asks the target to swap copy engine data
(CE_ATTR_BYTE_SWAP_DATA) and SRNG ring contents (HAL_SRNG_FLAGS_*_SWAP). In
my tests this did not work, and I could not find the root cause. As Kalle
mentioned in [1], the firmware branches seem to handle the swapping
differently. In practice the upstream driver never worked on big endian
hosts.

The series disables the hardware swapping and converts all host/target
structures to __le32 types, using the le32_{get,encode}_bits() and
{cpu,le32}_to_cpu() helpers. On little endian hosts the conversions are
no-ops, so the generated code should not change:

  1. remove the CE byte swap
  2. HTC messages
  3. HAL CE descriptors
  4. remaining HAL descriptors and SRNG swap flags
  5. DP and HTT messages
  6. WMI and testmode messages
  7. QMI target CE and service configuration

I am aware of the concerns raised in [1]: the risk of regressions, the
impact on downstream projects such as QSDK and OpenWrt that carry patches
on top of ath11k, and the possible performance cost compared to hardware
swapping. I am sending this as an RFC to discuss whether this direction is
acceptable for ath11k. I have split the series by subsystem to make the
review and any downstream rebasing easier.

[1] https://lore.kernel.org/linux-wireless/akYnvuVkIQrPcjkO@FUE-ALEWI-WINX/

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
Alexander Wilhelm (7):
      wifi: ath11k: remove CE byte swap for big endian hosts
      wifi: ath11k: convert HTC messages to little endian types
      wifi: ath11k: convert HAL CE descriptors to little endian types
      wifi: ath11k: convert remaining HAL descriptors to little endian types
      wifi: ath11k: convert DP and HTT messages to little endian types
      wifi: ath11k: convert WMI and testmode messages to little endian types
      wifi: ath11k: fix endianness of QMI target CE and service configuration

 drivers/net/wireless/ath/ath11k/ce.c                |   19 -
 drivers/net/wireless/ath/ath11k/ce.h                |    6 -
 drivers/net/wireless/ath/ath11k/core.h              |    4 +-
 drivers/net/wireless/ath/ath11k/dbring.c            |   44 +-
 drivers/net/wireless/ath/ath11k/debugfs.c           |    2 +-
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 2229 +++++++++++++++++++++++++++++++++++++++++------------------------------------
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 1638 +++++++++++++++++++++++++++++----------------------------
 drivers/net/wireless/ath/ath11k/dp.h                |  200 +++----
 drivers/net/wireless/ath/ath11k/dp_rx.c             |  270 +++++-----
 drivers/net/wireless/ath/ath11k/dp_tx.c             |  217 ++++----
 drivers/net/wireless/ath/ath11k/hal.c               |   96 ++--
 drivers/net/wireless/ath/ath11k/hal.h               |    8 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h          |  258 ++++-----
 drivers/net/wireless/ath/ath11k/hal_rx.c            |  712 +++++++++++++------------
 drivers/net/wireless/ath/ath11k/hal_rx.h            |   14 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c            |  106 ++--
 drivers/net/wireless/ath/ath11k/htc.c               |   83 ++-
 drivers/net/wireless/ath/ath11k/htc.h               |   30 +-
 drivers/net/wireless/ath/ath11k/hw.c                |    9 +-
 drivers/net/wireless/ath/ath11k/p2p.c               |   30 +-
 drivers/net/wireless/ath/ath11k/qmi.c               |   24 +-
 drivers/net/wireless/ath/ath11k/qmi.h               |   16 +-
 drivers/net/wireless/ath/ath11k/spectral.c          |    8 +-
 drivers/net/wireless/ath/ath11k/testmode.c          |   42 +-
 drivers/net/wireless/ath/ath11k/wmi.c               | 2834 ++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------
 drivers/net/wireless/ath/ath11k/wmi.h               | 2013 ++++++++++++++++++++++++++++++++++-----------------------------------
 26 files changed, 5635 insertions(+), 5277 deletions(-)
---
base-commit: e7f0f07b3267676087a62949a35ae919a9a8e218
change-id: 20261119-ath11k-support-big-endian-hosts-9f3186320f53

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>

