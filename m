Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794923439;
	b=5b8Pqtk5K3kgX+1qDR+6hnN/macN5rh+XR9DPgpkaK73b9xyicLFtnYx9L4qidoG62bO
	 i+nsDqD3pk1E/ziAwQBtIc2DqcCuSOE++hqM2IxoUknul628udaAHL42evqOAtVRx4YO9
	 dbk3zhVR8a5ppblKuxlVvTbLemaR3TAlqdJ7Qei7EFqBJyCwkKh544/woRLTlLn9ieiMj
	 KXoLbGRpZENpag5uMVlGKa2CuUK6DzQpF5rVPjehBwaWKlAL+7/Q7W3NjevTrVRf4bR4F
	 O+zyLGfAToZ0bWmKPkeGWWD8DDatiMHDMtJf7K+RumWeXS8oKSa95zJW6sqvvoH+cbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923439;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Zm1Sqtdp8oeMHGcFx+MD/4cHL2e8Mi3Vum6oztycPlY=;
	b=pmv57UH2MN+0c7uCIAfxhh9SSmJiiJwbYOMuVkZcbZIpGMHpnBiy8JGZioFNFp+ooIEx
	 g+QMZB/mDJ0nRjAXMqPZ+CbGzSDVS9tQjICIAh8gHjMbEgapfD3MKgIevlEhxqjFTtxkb
	 pKlIk4T4NjN6fdLa9Yn+Ctb49bjI8PZYH2OpgcTI4bCW3krmlmigXUeYXpGBLyQZBenS6
	 GNMYwz7rtdZ2vN3SAHKXoBUpHCORjjKjDDGNA/u59KHZH98ZTJXXI3YHE1roSLmwehrj2
	 n5pkyhzatUKjpodGjhskrjdQ2nr/pUtA7tsdr3Q5CLXQsJjQIKiGy+ye7Bdp1cZjyHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YASqJm7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.45
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D53606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YASqJm7z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Col1pkHmdonNtwqlle4VMFukstcwweCOTDXhJDdoh0h+GPIa8pq+uczdHz9OiXvNTeSmzB0F8+NZzFmbVTiZO48ODNDEhg/nyHRKDREb8FaoFxGvnSGCoqWSuIc3o2OyYmJSsP7aS//LRqCdr8Gy0/7eGhEoBzsTALzElsTeESCxmxgqAcD+kMK50Xnpd1IXPZK0eDvnIY5k4ikLUjiCAGJXbwr0FeSv3BeMtdw850mZ9UF/k67mjb81ynjSXqHJ+vLZdnhPS3GQfEmiklOhUsPuGhTIqyWaCHwwN5zkJgc+gXWdW2+xZ3HlVknSRCvxm48S8MNGtCzYEDo7FOsNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm1Sqtdp8oeMHGcFx+MD/4cHL2e8Mi3Vum6oztycPlY=;
 b=Ct/h/RofLTcB0QFWVXdB52d/xZuFLbiHisHEPFEJh2yyACi+z+ZpQMC3auNqc1/no0zjvDBoxy+B2ukZyKLKQM1j2RcAxOkehjfzdO4EPDapi1G2DADz/fa1I9YXwe2zz91TDZjYnn3WB1rcJTsWYusz+jLGGzr4T9KTs9WRSnX8oUE0zpZNsa0Lp0FUpLybRWemK4a0UxftY+Fr4Ab7B8X45MVoyJKzNN1ZerB+yEK8cRSJZfxIRrukVhnfjlck0eBXlwSLXeMlfxV62J47GMjq3lTJuZyBmUePdnmtx89+rbZ+fFLIEUJqn/G1/s9ZWqk0+7j4P5/92muz9eBeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm1Sqtdp8oeMHGcFx+MD/4cHL2e8Mi3Vum6oztycPlY=;
 b=YASqJm7z8DjCpcQC1dG5aElZXA1Oa1jl/CMsQhvjMIlMMWjRTW7XZSU1iK3uvp/m574jh0cAbaJqwnguxDIJ+5rH1wMIDzejTE0KiryFAf/7hSNNZJE2Vr/qlCY35iVTwmlUDGm7KRh+usXYXy9AcbjDu4mXCgbRz7PReH+hiy3hqF++QGodsL9dqgadG0s3pWf5ZHNpbr+VTB4FUv7YMqVP64g0BDa3DXZhfj0rGVelcEBa99F3/ry/6TcIGmAmriAPdJ5FJEbaWLZy718BYqyVPDSGG92XteME1Wu1EDeOi7bflqH/+Q2gTJPXdMyiwKdHNIArNSEDv4c9IuTm8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS8PR04MB8562.eurprd04.prod.outlook.com (2603:10a6:20b:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:50:36 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:50:36 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	johannes@sipsolutions.net
Subject: Re: pull-request: nxpwifi-next-20261106
Date: Tue, 17 Nov 2026 21:44:56 +0800
Message-Id: <20261117134456.477898-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111013858.98465-1-jeff.chen_1@oss.nxp.com>
References: <20261111013858.98465-1-jeff.chen_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d720281-6734-45be-df27-08df44b1c17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	pyE66jML5Qr2/d6szJ6MU1KH2vDt+HNEyY2ymXDFzZ6KpiZ9L3IQom8lU2IzstAV2A0SFjj/YynPIXSZeEKaZnrkH8DTuo8uEhENX7w6GBU/LnGMZKYy1kXON4PbJpK5SNIkjGg6UTBGB4iJFyCUccOHXydEVAnt7umwNU3aHd+1GJayM0wO6ALExY3MD8VD0ocvsNoQTrDbEweZo2I7BlYUJ8yrZlpCptdUMIKKDVUZep83Rt+8PqPZuADdSQ//Tu/ckiGJp0EcUxq3Ga5uZtx1B2crmcVlKnYjfT5p3lgGow5m8Vz1jJ/Pm+M/qatx7uiiPadB/0mwbL8jxl9oTAuDsOS7CWjoH4wKRAu0rAwRYBLI1vbtJWlj4d4jhVP/ZIEfGFmOLw7eNmi8KBeNFolib2KeOYlFedjfc7P/oWemvICZQ1vloX7j6UC1lv/XMchY+jVkNyv8Ju3SzACV/dJdN8w2lwHkwA+qGqIRj/Xjn4agizq7ypMql2D4iFumDa/jRS50d7nciCnIE92IyRT6r6z4vlU2vQcnJKs9XluJA5ExAEV6m6KNWIT0rakQNVWZh5ZO30/w6V4XYuz5NxnGnqQDG6bof/ZlxboI/IlQTpF8K/f/uiFu86T47/CvyLwD9AhzyCXofQ4IhtV01pwSIqyswUhMlvE2l71zFE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpTSDT5DsXw08CDVjo+TcB0F8mzGO+tkFi7HGYDAq6To0UxpS0FHASJohcRC?=
 =?us-ascii?Q?WCldEWiEc2WCsMgJgMsVOKa0m8JdCiq/pb7t+s0IYpkFlSX2hIC+AHpNkS93?=
 =?us-ascii?Q?m5Lkib5B9ntRk+nEAWqHUqJck1Mw6er3J7BP1A2BlMjgEi3Jl5lukDFGBPPx?=
 =?us-ascii?Q?GMkGXdYVDDzvUikiL0HnBs9SVcN/Yi7Iz287aomG9ojjM+AqzvvH03hxMZCp?=
 =?us-ascii?Q?pJ7zyvqlIHjR7amLBRC8S4Ko6oUwrrIC9t4cBo84TeQbZ7evyejLPAbNzFPK?=
 =?us-ascii?Q?6Fv1UENqXQlIsJzhvOnK1/ZepQ0YR/H7At1RPy2ZcpR7Us2bZ0zcLsS5pz4P?=
 =?us-ascii?Q?Ug14m0xOe8QxUB8D3G4xRItRxM/qzXu9XLBh0FZ3Imz9kyqDTjfjynCpuq//?=
 =?us-ascii?Q?SMafbM5IF66ZhS8vfUqQzBf+RnWs8Z3D/MlQ50kBUkBlDHMSoOgIAL8t9nMj?=
 =?us-ascii?Q?oY8utbyROiNqQBKga5FR2Yoz/5/Pc043sGVhgRg/fNIeUyce+TSZBZ4nOo5Q?=
 =?us-ascii?Q?VayB/mLYMy43X4rLaHCNau/4pF0XA9FUfThbAYsFCd8rL2kj9izRkkjp4n93?=
 =?us-ascii?Q?UwLquLyhExPj5WYRqj8E2HNgfQs9o9vWcsXPieUoCCN5jMuo7cI4fXwq9vP0?=
 =?us-ascii?Q?qJHTxTgXkLZrvpUerlOJBD41if2Om7+QHkTxw4pomrHMdJM0WaAjPUT9rcly?=
 =?us-ascii?Q?u41CHZ+Jw0C/MnQoz4WxLASs7KvXc37C1oyx2p13UTu69Nrp65iQBLkY4QDV?=
 =?us-ascii?Q?nTXWZe6RpE/GKx2YL8jGVyst8FTnzxxwh7HuS8GQIy7Zb33UsKP4k7XsBi0s?=
 =?us-ascii?Q?d1Uou/ZXbJslI78PNd5/DPhmXxIYCTb4+yKYxdUzWObNktGHOjolPTZWcuqS?=
 =?us-ascii?Q?w1Uflr/3FiZXpa2zLVKME3cvZyxs48CivEjU863+Cgcmc5UoSOfvzGjEAFFf?=
 =?us-ascii?Q?GzwFNAZ0IhfkuqSvCnunUTPpCTH3IGW3q048mXfcI0gViqdo1bizwhCnTI5n?=
 =?us-ascii?Q?yqUl4e9kZQB/Fx6Kxxj5Gw+K9l9xnRtqTACnhfpV37yj2+cSWYsvimnSRAaA?=
 =?us-ascii?Q?Buw+Vzkbyz7k+Jc/MmSb67H7TZBwIlHDFiuZBFHRGzRsNQtpIHJpbTuAMkZF?=
 =?us-ascii?Q?YH7ZfFpHqmc0+5KcrBAFJhDJW6Sr5EkcxgdpPMSp5bJo79usK4OJgbk8imtZ?=
 =?us-ascii?Q?Us0x+o7z70vuv4n3JmdG2vguNYPKkv1sc4S85YwZDfVfABM5l+WAR1Tyi0Cp?=
 =?us-ascii?Q?O9EApuDG9jWKxtO1//rfoEutyyn3GCxqwhKWqJUXyY+5rNPqDH3VAdl0DtGC?=
 =?us-ascii?Q?U1axc8KM+ysBCoNCL/ty6D2g2jPzRwLphcSJlR6zI74zOjbeFLZMnJ9wMVtb?=
 =?us-ascii?Q?ZDMkffkaDGmOudLv8frnoUBhcA0V8VKqHpabqmoTrCKIUgo8ol0+nGy0UEPL?=
 =?us-ascii?Q?HCKpVG6TiayOfMhGYnEp9DNnB2FE8nA1XNAkE/EtdBX/Boq4pncXXhOebMQn?=
 =?us-ascii?Q?snKr16uACweKox+756JUWEUK8nOCcIoYtJhTADraPvJKgvefHf7ao/ztq6yj?=
 =?us-ascii?Q?0iadMjJD1HkKJT7mBkK8xxZeFvxRGk4flll7pRlOWIuqDdTAi8yMGOU4TM0P?=
 =?us-ascii?Q?jqkQqhteU7wKyUmC1njaN/myMz0qgWmVxsYZF6V3tfx2MA39uHpySElwhEUW?=
 =?us-ascii?Q?+2ctKswz3YeC08KBYBidMe6YkM3VQU+bnvoJBZTjY+GU42YT+olXiwyRF/Rn?=
 =?us-ascii?Q?7yhwUSNwFBfSS7y58/XbLcGqRoGyeAJq7CpYWdSkdMw4OIMz0QZW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d720281-6734-45be-df27-08df44b1c17a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:50:36.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhrZL9bQ1SExwK8Fr5f44yKqhC+INLaX8enFqzGwKXO1lTQbzHiGIKzRrs1vLX+yPxrX7LdLhrXB+qlDWR5j2OWO4uAFjJPvv8oWZXpuP2Em4m2BZACqHrU0Hn9hoAG7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Nov 11, 2026 at 09:38:58 AM +0800, jeff.chen_1@oss.nxp.com wrote:
> Hi Johannes,
> 
> Please pull the following nxpwifi updates for Linux v7.5.
> This series adds P2P support for nxpwifi.
> Resending the pull request.
> 
> Thanks,
> Jeff

Hi Johannes,

Just following up on this pull request.
Please let me know if there are any concerns or if any changes are needed.

Thanks,
Jeff

