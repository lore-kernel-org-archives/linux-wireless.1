Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795500766;
	b=CHtn2bgUK2w2LKvQEQnLICxLqJ3tgahUYpoExIWENoIe20Ho9YbcDJ2A7QA1cER8qLRg
	 A/rOZCo1DIbrgKN8usF0dcRQD2NJVKyzGBaGzoBhQJzJsmBhfOjK3t05gAzhZkoC6ZUZA
	 0W2S+truC/5Gm3ASJKpFtSWxMua088ATkH/myqyJEPPEmv3SWITmI3QhegLKdT7ICMUDh
	 v7gb7PiV9EgT5jW9kA9BoT1AEapWD/avk89jyZjoa8A1fwx6WgEsQRiDmYOmZ8h3CGDt3
	 GvsOWbUbAR9OR/StWoAus2Qg/0conFOXTsep5ccG+/9z4rD5b4SgytW7m7tbAa3qIRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500766;
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
	bh=zA8wErONrXOighvzmUck7TvtpoKsJ2pUDLy6S14+UYQ=;
	b=cLriJZBhDYTtm25B8tI35W0dHf/RbJEtZx8wvBmBRuFWQMWi1DcpKA/hUpLcX/pu8M9v
	 cK8zk7lZneMdnRuIjVssQsWJon49fhc6vvjOc0IfDqoSSLX7Vnelml6ulNSh7rdN0zK9C
	 N2Tg3zefO8gfjr3+BkVJJjM21puei12lbGnPU8WeFU3P1xNMRgXm86cZ9AII3TjMKwjpC
	 fTdYgmMZAw+bnkBIGngZHNsz6nyyKeAoBAQDp1XZJAjI+nMLwEg792Bg3xaW8hKdE0rzt
	 p608H2hcaKev+spK9dwdnA6nZM3SW9vQrGOoRylaIfRIFNjUzYt1Ps6t4E9Br8EBwdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x+AFL+es;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.8
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB642606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB642606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=x+AFL+es
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJOnTXaf/yaOO9wHrQpAB5HAOWdhpxvV/A1Bzh11mozOAR4L2pg/MFnhvcHZHN+iwmzGfUFdz1Vn2yTGColYf4P2H9yX52L4RPoCZNU2YYPu+pE0S7vtSjOM8Bq4Dy0VAI9PzArjL7MY1XHNNAnloUZGalBhR3ZMC36upOP1n9sAqCjyK2yN6ElXt+E2oSuNvIYSQtEKkUIfFYkEM37902s2CLYJNxiBd6G4TcrYV7lDlzs/DJdjAyejE6/t3n0WwAQWycS/WZlV9f/G0vJ5KvblCCzn04rcJUEw4NxopKxtUAca29URh7I9eckcWlhb9N9erALkrH6TbmFrM8Wusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zA8wErONrXOighvzmUck7TvtpoKsJ2pUDLy6S14+UYQ=;
 b=mVuGad+oUp6VUn4fmMkeQtqcYBg3ZKJeriVTPI8unKbfu9isZSiIOGbcwlnpW3/8FQpyYJx38JhdHmHrCVxOrO7UAufseqPvPVGb0aHc4/ICB3MPd2p6Nc9djKiYjgFvmG29a1kCIVXLBNjYTY6SsR5LK+tR9i8t+5NUTFJgBvtnMgeVKOUr7IANyDf5BxijdQxqZkDOx+bQqmAFP+8Np3rZwaJ1+1zrmBOfh2kpTbLdXZO6Lk2qo2iNflUKEcePzEOVecbYfLhkZpd5h90uDemy1fRalcqfRx69FWNjYoOf/hc0BezVZxbwfJWr6GNNlgZf+wrIvxbayorf3WJ1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA8wErONrXOighvzmUck7TvtpoKsJ2pUDLy6S14+UYQ=;
 b=x+AFL+esYFplrKkIsrC3KDwhJkq0HO20ezBBmT6zT45btRpn/rWNiPuVbeTrpjFOXwkDjzcsdmdD2E9PkzYimNE0Zy7kX1s014ZuAzE/2dK4la32F03z76bRIJTH3yQR4CFn/ff2uvK5/f04XMiB7e4C6Zxf5T3FVut/XuWSpx2gBYGNxZwGiQp1TRVvfKXHGr5lE33lMFsxh9WGEX5kH3UoVyHnw6g8U1saQun+8o+9rO8QRuF+6Dgfi8XWSNiyOfI9Qfmvw+5DJqhTl4nnsNRtlkCn9SiGiVCT/KtAsWkMAhwJsPh/cwT7i/X3jBzQkZpeURECfIyyeFP6AZlLog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by BESPR04MB717521.eurprd04.prod.outlook.com (2603:10a6:b10:12e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:12:43 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:12:43 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH wireless] wifi: mwifiex: zero-pad SDIO TX buffer to block-aligned transfer length
Date: Tue, 24 Nov 2026 14:11:46 +0800
Message-Id: <20261124061146.801381-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102221530.3469388-1-tristan@talencesecurity.com>
References: <20261102221530.3469388-1-tristan@talencesecurity.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0177.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::14) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|BESPR04MB717521:EE_
X-MS-Office365-Filtering-Correlation-Id: 617fcb40-d7f9-41b4-e90f-08df49f1f332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|10067099003|261028144727099003|56012099006|11063799006|261021121427099003|261026140227099003|261022105027099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3ZNln2S0I+ZtyM8CxYVLof+FJJ/i8Zwh/B6uwBzFqfZ4t/6n0jUcdv8tS6yjrCF5HVHTq6RYQP1quLWA3O0MJ2ZEWJF3wHUMKbxL9WEUAIkqGg5Fciydhw1ggUxABur/IZPz6HQ8w4+SoBtzeic5IU0xeLJmBeWO+cwzZim6lGK/StYl+Jh+pA2J0HAuV97Za3tAzhL+CGXifRUGOnZ8+ZX6IAu6Wsyv6c+HhwGueZi7WddK7q4VQaKT+BL3Evk49wWJ8xcsAjVdXV3k0if4Z8yrsB7zo+6aS8pLNfC7l7sa03E5LbocFnomXJMo9ZdZTBPdFS2suY2yUEsXDFBbcEQNARgVbO8dC3d0YJTNLiop99/oTp2xVIOA8MoT6d2BHmq8yFwuS1bHroSCKSst2DEC7I6iuK8ojxAX48+0IxkMIP4t0zqUg1B3BMgBWOTEJr8hK5N9J8PdlPoRH7Rioon+n/MyBrUWiiFkZRpJqhHDkT1xyXK3GEdTku4q3tY561Wwme/p+bg4mvoWRf0F4sSmfabkGmI1Bfqt1V7+53fk9CYTWkKEmNGt0m98D0ea2QBLYS1UDzryDeZG6IpQ5DARNJ/vSzrddO8td1YQeUqQR8NDxLXfu+BgR4wtYLX5Tgn6Vobc0CM1oUT071UMfrLMQrX/vNHFYqzHt57BYkc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(261028144727099003)(56012099006)(11063799006)(261021121427099003)(261026140227099003)(261022105027099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ptlC2Eepn6tBOI4XkdCcqlU5WcvDJmfMdB+V36GhQXixmmo0Jej4W1xHX9d?=
 =?us-ascii?Q?0RrZsz4Zr9YKqB5ESmMLZQaMisV85I/ocMolj7O8oM4MLOZ+1HMFJq0I2PgU?=
 =?us-ascii?Q?3uia7sAtvez71w60KhUZd6hAync8wDTndAXWqI/6w963RqMhF0EtEU/iAJuz?=
 =?us-ascii?Q?qalEt4CSyqrDorG+aCbEB1xH6LzgDw6eWc9dyvy9JhvW832m91uKbXVAgKQG?=
 =?us-ascii?Q?Kwm3Lxxf9LLXi/dN+4WbOaMP2HnK29NklX0D4R13EWKoE6DpL1gYClsONOTb?=
 =?us-ascii?Q?THihteTmh0u3nRDyiv8Twn6Yj2LwVF6yMRKX6kfl/titikrcPRtKe8HKqBcq?=
 =?us-ascii?Q?IzLLvwhyNIORhEIm7ReZMK6w64a6Pin2ndUHsHv2q2F4822py2UoVFd7JYSf?=
 =?us-ascii?Q?0P6Rqeyrf2C1ZLLmysYJwzHbcc1znSuaOhWNlHBM8tITDh0QczRW74iwvKX7?=
 =?us-ascii?Q?dxM3DBQvKH8Q6PRozJN0LVc04xBvw7e11Ay426kNS51EkKGT3l+SM8McFikh?=
 =?us-ascii?Q?aXPyUj+hnrTwnqbSQ1Z1Vi5YMtSKdRvdJSI7m8syVJkI/HvGSBB+G3Q5wnSV?=
 =?us-ascii?Q?BTzfkv1gTq2iV+f9R9YAF2s87D2k2f5nUp5ixCbAtXdTWdl6AfBBH1pJlvze?=
 =?us-ascii?Q?MoEafCMnZWJHwDAp3Fj2p9Sghqc7LMjy4MvZ/UDr0/kbhSBZyw9YYGmqCMpi?=
 =?us-ascii?Q?iCdRGilk2eRcuMWcaf1xslPipu+BRbVPv294cH/Dgq2zxR5MnHl+5IcHJxQM?=
 =?us-ascii?Q?vyMtaZ7BFBqIyqfY1GbKB35iWn1LJFQrQ1R7SyIKiHaVTQQtE7IZv/oO2BGi?=
 =?us-ascii?Q?jhLgNit7thinalalmyDWdg/8QjyMbywHox7OHtAKdmAXF5gMoXpohcol3j7C?=
 =?us-ascii?Q?p/tMqUTY/rGfH1bg3qHA3M826FSyrjwjtfe5MI1irATBmD/BcQkLJA6GtGB9?=
 =?us-ascii?Q?I2c+WBP+Z+uGttkpjf5YwVmiDytjifW1ItxuskZcpA5ViNqV4P85NW0SqqZm?=
 =?us-ascii?Q?dEn3NguSx9wJKOAZy9BqHvUP0x8G+dzZJECYzUNjp/QtDX/eBFC0xRTDYcUY?=
 =?us-ascii?Q?q3TzyO7tKEoqjYJFPnzAkGfSACK5C5YbnQgUPcpZsBKKgYJpL29Sflae2+5P?=
 =?us-ascii?Q?mREOj9MW35hmCCTkqBExD0jWpYqf3NlvxwBkOTUTvfaZOt9L+rOzjXQsWMJ9?=
 =?us-ascii?Q?lelrC2zrmpNQH86BdlURRN0EYduvDZfI2kY8QKaK1UCaDUiZ1MEKE0Gb7uOg?=
 =?us-ascii?Q?xMzKWIAseKhJo4loRY6QMJReSkq8LEJIulE40HaHq+O/yWBoEQrcxbXjvKtS?=
 =?us-ascii?Q?nfLcDv5giDaC3xBcw+YY9WeYuzpPe1rQnBPysJQrtQ58EIQ+tfwDyhb3nCvo?=
 =?us-ascii?Q?XtsKhSxitcINtancNr42CjxUJQQg80OF8Me1Nx9TPHwshpLiaXyaAz9P8eQR?=
 =?us-ascii?Q?Fcb4+z/O2LeuW1X/gWIMUrYHgQQqsRygy27ChKzALiyEEKqpslc/l57QlFeF?=
 =?us-ascii?Q?9foHDGnMjWjTJhiVSqhNB37GifNfBT1MDq3LEM9ZQGNxUTee0PSHv4lEGA9X?=
 =?us-ascii?Q?rb4tkquNk2mArokXyX+A8SRmOlGwUH6u86Q0H7Q015Gj1QDU30bZ8c52fBo6?=
 =?us-ascii?Q?8rC3nMQyWj1ne0NMh41b+8ufyI2+wUjAyY3dgefOi1C4AgfjBhLWR75qiOGo?=
 =?us-ascii?Q?PxXu6/oU62561OlUKm1HNhKUr7ph0s6GkUyQVQm+3CRL3l3/ePnAxoKmauEJ?=
 =?us-ascii?Q?uRW5ICNU0F6GU2eJNxjMNNAfZqUMk03l3I4szbMOU0ih8uKnUmlA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617fcb40-d7f9-41b4-e90f-08df49f1f332
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:12:43.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzIN73EieHzZM8K3YAoit7tVOP5PCJm9j4+9+OE2Q0HemTqsNqLmugHRz5ilKz9nwF9VQVSMs/9tshEWAW/M4PbG/KPkkaYwIjHyAOVArS9BL3FSpXwtyMlUtmTnKEGI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB717521

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Mon, Nov 02, 2026 at 10:15:30 PM +0000, Tristan Madani wrote:
> mwifiex_sdio_host_to_card() rounds up the packet length to
> MWIFIEX_SDIO_BLOCK_SIZE (256 bytes) for SDIO block-mode transfers.
> When the original skb data is shorter than the rounded-up length, the
> SDIO controller reads past the valid payload into uninitialized skb
> tailroom, transmitting stale data to the wireless device firmware.
> 
> Extend the skb to the block-aligned transfer length and zero the
> padding when sufficient tailroom is available, preventing the data
> leak.
> 
> Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/sdio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
> index f039d6f19183a..c46a048cc961a 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sdio.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
> @@ -2386,6 +2386,9 @@ static int mwifiex_sdio_host_to_card(struct mwifiex_adapter *adapter,
>  	/* Transfer data to card */
>  	pkt_len = buf_block_len * blk_size;
>  
> +	if (pkt_len > skb->len && skb_tailroom(skb) >= pkt_len - skb->len)
> +		memset(skb_put(skb, pkt_len - skb->len), 0, pkt_len - skb->len);
> +
>  	if (tx_param)
>  		ret = mwifiex_host_to_card_mp_aggr(adapter, payload, pkt_len,
>  						   port, tx_param->next_pkt_len

The leak is real, but there are two problems:

1. When the skb does not have enough tailroom, the padding is not
   zeroed.

2. skb_put() changes skb->len permanently. adapter->sleep_cfm is
   allocated once and reused, so after the first send its SDIO
   header length becomes the padded length.

Could you zero the padding without changing skb->len, and also handle
the case where the tailroom is too small? For example, when there is
enough tailroom:

	memset(skb_tail_pointer(skb), 0, pkt_len - skb->len);

