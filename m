Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794315065;
	b=LZAaNq4b4p78ahtZtI3Gf9uEEAmjR93FOAjSotxqQQ5LF+hJRT3U73m/bz2idc/rhzx8
	 6U+51NKD7Y3+td5c831jW/Zc71p2qBVRibzlhc0I2TaFpW4xdTlxvEE0YADXCrRCdm2pa
	 y2IfPPK7lnecT9c15URfgl8yhpImbUzdifzhnOpEivWzEVUavgDfroajfT3nEu1oKvH6a
	 ZcEPIJ/8XW5nZP3JBNBbKexbasMAPFcuwaBFLML/Ti/T7XooeGloOTJ7ehXFmZFa+J3ey
	 GHHBrQoqqAz8nt9oD+5AQhGCXIX8pbu9REx+7xJhI5iedfnj/Qt8JaT665p2hcOpjxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315065;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rnsIzeFEhylohdqG1yqJ5J1srknMtFqeDH2FHYdIf1U=;
	b=b4V2UNyZ43laxBcZWBr6kAxWvv7wwa5jiPfifNWCYxL96hkglqd+VbdNIcJtSuDcehrN
	 NEjfVlopM/vFK31uwNnz6RWQ99FtRIvHHJ6JShpECcMacacCrPs35wbG361KzHvMoN/gy
	 lIEiVqZr9xvgS3rgFfAFh4DVvFAnnBmGyB/Z7ecTkg1YIXfNmopwg+Ns3dUz+2+fgb7g8
	 FSa9lMjBOGQyFytIhZs3E0OUMJoSUjJMsIZ/xmZoiSUdSo/CROT9vcOcOzy+8u+q7yHER
	 6J5vKGcpPcaS6eY7cgHsT7doxqIc8rT0gLicgQi4QuoNm/PRme90PqqUMFlkn78LALg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AvPkzdcX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.3
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B1606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 12:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=AvPkzdcX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIX6zUj6aLRKWhhpcLOtYjjNhzzpVWxgVwG+liMtIWAjNmcJvaik0MxRdakH8Wrost08FE44U+dii9D/jhBBbboSWld7tgF1yIGtBIooWRwp+qAaTaDIRZxeChbICB/76NeUZFDPDt/BSrOeW5mxoqy2Gf9rvhZ9NZ/LLgau28AI+gPq9bHgN4jn6Ivh8y7XNmyZpYxRCa5TremPvkwqoXOPn5iM3tdV/Y/UCGVIFu0dTVGYJQgjRkR846SLfZQYgwAUoJpt8Nj3LKrAKa0x+SCcjSrbfgMeJ4Of/KFCGRdiEJcFobvUA53LLcCps6nIAN6beTieAcR7wJqoVzNd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnsIzeFEhylohdqG1yqJ5J1srknMtFqeDH2FHYdIf1U=;
 b=NldrduB4XVlC8YQ/9TMHHyjVsiwA4uNuXyoPtoLXCMoKGK2kr8UxYBeiG8dAPWcGMeyXmvxHRwrrsCq/91AuJS+7hh9Mf4kOc5qb2Id+lmnDeKTs8VH9w5J5qC7XNZq7wbP38NkHu86lajKcBEeReqx3k/zy33Zty9ijTcZnuW29zqw0vbMbpFoZbs4ys7KZ3PDYmX0CVv5ZZupFYPFfedh/qDcUvlyEXtv/tDRp+hwVcTNbQIxYzmh693vSJKShqCuJP0Vq88tjEVMIz2Sh125n75rJy52kY19dXvJNP+PgYXnrHVXprjm1D32Ktj2MCE88AzmhKY3Gx2gOyGqdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnsIzeFEhylohdqG1yqJ5J1srknMtFqeDH2FHYdIf1U=;
 b=AvPkzdcXgOwNTD6dIi+bfY3N6vZgZFdzfUk88WP8fgPQ7CRkFlTtDvZgPAunLahAQ+x0BuAyZDQhwSD3xaaBavfKIXCekx2ftDJo6xfRUL18xlKL5kO46PUmN5l7fiYcgD6TM+NaXVqkOyxWbSFikTVfUE1EVC+nmYaq+ItJIG4eiWhp5ZVCBPtz6m3RIKX63xD+yjpfUoQn3iaK33qgbIg8UlCFKNBqoNgxOJZg6qmYdGs+T66FfQ9B+t+/q8w+HLpX0hXRRJqsiEEB1pVser6THlO9Q++HG+4UzGYzdtBoHtC8i6xOHQdSXrXxKvqAxkRIDp/RlU8RfOvvQnDxyw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 12:50:59 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 12:50:59 +0000
From: jeff.chen_1@oss.nxp.com
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net
Subject: pull-request: nxpwifi-fixes-20261103-v2
Date: Tue, 10 Nov 2026 20:50:04 +0800
Message-Id: <20261110125004.85365-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0052.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::32) To VE1PR04MB7280.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 31312005-d8bb-4a35-922b-08df3f2944e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|18002099003|56012099006|261028144727099003|10067099003|11063799006|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	mqqGbEUDzIe4zHRegQ8V5WkOpnhkTIBqXxBQ2y4rub8fsjc8vq20BV5g8QhVwy9cTdR5NW5I5AAqxLWuoG4ENsXvc9iCmvAkBr2qvAbkSfCo+R3yrsg/69OSEYyANh39puGzigUYn0S1fvI4qBgXg20hgB2aq4MVlXIBwVN4FvLHgGP4X1MbyV5A4MrWJmz2GE2VgYJn+nkX6v7CpZ9bR9nJUYDhW90l6TiZ2VnB3gxzYgXFF+HzNgHiK8hT8eY9ZRWwcryix6ZTG5e9Ubu+5UJ7qmpohEee63iCRNtkRQ0ls8muSxhlYVRl/0NjWhipDOe4p8u1vTIBOmya7TNLvTeEv7C6GNZaCcf0nylsR81cwgjWfO+e6lhdq9IPMStHWZzkmSAEfa0VIil89sTUXA000uQ7qzH3OJACbiFi74sTQvtC9ZgDkGr07+tU9GO25qAy129ADoHfTxMaiEERIKLjofWLUbqNwmABOQuGXEMVPV/vR7DQ0HYxW6/hFqT/8qRaHYVnuUKcR7BGcHHn3HaAyGlzqoX+IMJvohF1Fm/j8d2XDWrEElVlSaM3XHFWR2+te+fCvoC6cKcqhjBsoGyRoGwPeOMxKgZZ5fMyqgbQxoMK3aZLYuXT8Bu/BQPphLrTnFvPYRO2b7o9R3JzQFZyVqWlF/7AhNnQy1/neeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(18002099003)(56012099006)(261028144727099003)(10067099003)(11063799006)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FGacwkMhSIBRPtC8d35VX/44nR07KMwotpb8cX6Smi5dw09G8vvBbJn+Sv8?=
 =?us-ascii?Q?+kNMUMgNh4+k+KDhaKXCq8NfF6B+45BY+5q/1CjZDNK+FdEL/l963J1XFH7q?=
 =?us-ascii?Q?jwwJ85xCHXRw/EFK+838JwUYCzRKnH9UCyyB3kD4KDtsJlykM2c7G7b4Dthm?=
 =?us-ascii?Q?Kgd3cqT7qgf52P0f6AuLhmXcxJ/IAEVt3bugi7onX1gbx0KwWIvFFRncYqCi?=
 =?us-ascii?Q?Uac2tZmA0jK5fUz8hlb8zIuPsq4A237Wy+YYI/RYrVizanG1U5zs6LaVei3d?=
 =?us-ascii?Q?n00/koo0wc8n+fo3wF9LzKtcqCSxYoyONT1yScUZ0ZSpP3QRBrzIigO3RuUg?=
 =?us-ascii?Q?+8rAoaLYwfdeIlLQbSS5OVC3nXz/Ct7U5EqdPrcPffmxtJSxoy5Mkj3xxPi2?=
 =?us-ascii?Q?k7OD5bQxMPxCcp5SNEV27pmAi0irk9yJsjhKb0lFyxfxXFvtJibWBYCWKLob?=
 =?us-ascii?Q?rIcVrFQOkfu5BHa0f37q0qrZoSmXgzmEoqssejbovc+Ofq5f+4f13PFCh93Y?=
 =?us-ascii?Q?w36kCV3zdJm518DFI8mlwzeDGpe7Q9N9rxMMv8bhOb8TCLmoueRcIMv6WUIP?=
 =?us-ascii?Q?ruTi8FqIrwovUu5leN4OM/rZK4S92cUY1Wg7chUon/rFJgZ+3jURjrz9XXZg?=
 =?us-ascii?Q?Yc5hLqOfpt01BXJwwUAwR5AN2/9ACNTJSjzohTqOvitMie/9c6SdKoqHmUxI?=
 =?us-ascii?Q?g8gD9V+QAM1EDqJzpexQY5VFyeuJL/YVqvpOa9xIf6bYDcmRaTio6uog484R?=
 =?us-ascii?Q?5AN5VRss4epJQAYhLJQZFfOAqzliW+iCNQCgUUodgrZ4IVRbKzGyDUNpYPm+?=
 =?us-ascii?Q?DkbDsICjCeo+aTy1xFcjCXerWBaStJ+ofOxt4LDzJTiJuKpIrLuKILmHeck/?=
 =?us-ascii?Q?u0gy68SsQDzSs+jebFKwz2geKBLzjx7Y1THGkx/uo1hGbhg0Vw2oH2i8qktT?=
 =?us-ascii?Q?B94CKVKekiWOhGRizirxkqECl+nmZ4LjykZBiBlwHAhZ8nZwmI+44aVYWHXN?=
 =?us-ascii?Q?p4+aThNvjDDnV14BYNVVkme/1o9aWCOtanMs8Br2ObgSiycwo3gJHAEOt1NH?=
 =?us-ascii?Q?sfb59+qZ+VAhe1wNzF5elN+oSVbuVPXufAP9zQpfysMviV0za/iNCTiSd2fP?=
 =?us-ascii?Q?NvykvGHSZ74Tk5vttQTxnXrMr/omQGZqlcLoNvHNLNc9r1FJ7dJnkM43RWhz?=
 =?us-ascii?Q?j9djrutBTzOUpFIGnlPK1n1BZgvwqF0O3Kk9YWbHjxdAUcqREflYB8PAts1R?=
 =?us-ascii?Q?vNC6x3J7RgY6uoo3DHmtnSQTVgSK+S12lzO2jLoFNwq54weeJp5MU4AfftUe?=
 =?us-ascii?Q?sZlMztrxns5gzODXsxeI9Oqjk4EwoEATe9RdN0PwX/tbXjs0p286k3SPXW38?=
 =?us-ascii?Q?2vRQNwBEX9RWmWcDar2Ugv/3xe3PBdonSkOjDa+Xfq+7Of/ToY+bRjxibH0x?=
 =?us-ascii?Q?kdsbSFZc8jqOhr2qEs9sY/l4BeucifUi8/FadkdoR33tl69GWaBdP8NwKRjJ?=
 =?us-ascii?Q?iGAlXMR57bpP2qadeqgVP5MjVYmOOlwj55VjhdlW8l++d+ML4zOey4erdog1?=
 =?us-ascii?Q?HoC/6ElgqfepyiXGlC9VbrfHgkyhmyeMpzg/mAbTmj3LRPXP+pHmeZpdQgKr?=
 =?us-ascii?Q?bNukLNpfaDAiardZl7E3Quw8NWnZOHXgMRb+QnH3BP34hywpRwk9kRrKshxA?=
 =?us-ascii?Q?otgNMHlRP0Cn/9RPvX7CyZRu/1OCd4KVn0YfAudteE0e/0VzM68pbfkc++Df?=
 =?us-ascii?Q?VzhWiSaCWDHfN24X2DaOFzxc98wJyVaheqSe2ZG7jUChO2lGP7q7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31312005-d8bb-4a35-922b-08df3f2944e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:50:59.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JKa9P9O3x0D4Du6y+FyditIkdbPY0BZ+vFHvVScMtGKpuXUkmfB5xu2VbiQJqfjigJU/1YQ+75hpmEEYl23tftNG0H4WMoJSuWj/E2eHaSWDBAWHhfPRTK1H4MmPdjB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088

Hi Johannes,

Sorry for the previous omission. This is v2 of the pull request with the signed tag included.

Please pull the following nxpwifi updates for Linux 7.4.

Thanks,
Jeff


The following changes since commit c3e67bd82b9b9b1a5118f09a429ccefe2aab0741:

  ipv6: reject wrapped temporary address preferred lifetimes (2026-11-02 22:31:32 +0100)

are available in the Git repository at:

  https://github.com/nxp-upstream/nxpwifi-next.git tags/nxpwifi-fixes-2026-11-03

for you to fetch changes up to e7c7c4ca5c41c38bcd6bb08ab57f6ce53f4ed0df:

  wifi: nxpwifi: validate monitor RX extra-header length (2026-11-03 14:23:57 +0800)

----------------------------------------------------------------
nxpwifi updates for 7.4

- Validate monitor RX extra-header lengths before accessing
  rxpd_extra_info.

- Validate scan response TLV sizes before indexed access.

- Synchronize scan cancellation state handling.

- Harden 11ax response processing against detached command buffers.

- Fix 11AX_CFG extension ID parsing and validate TLV lengths in
  firmware responses.

----------------------------------------------------------------
Heyang Tan (1):
      wifi: nxpwifi: validate monitor RX extra-header length

Tristan Madani (1):
      wifi: nxpwifi: validate scan response TLV sizes before indexed access

Vishal Gupta (1):
      wifi: nxpwifi: synchronize scan cancellation state

Yehyeong Lee (3):
      wifi: nxpwifi: guard the 11ax response handlers against a detached command buffer
      wifi: nxpwifi: read the 11AX_CFG extension ID at the right offset
      wifi: nxpwifi: bound the TLV lengths in the 11AX_CFG response

 drivers/net/wireless/nxp/nxpwifi/11ax.c | 67 +++++++++++++++++++++++----------
 drivers/net/wireless/nxp/nxpwifi/scan.c | 52 ++++++++++++++++---------
 drivers/net/wireless/nxp/nxpwifi/util.c |  4 ++
 3 files changed, 86 insertions(+), 37 deletions(-)
