Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794993976;
	b=CYIMadE4xS5aRxTQ/S6StBT+RrHQtI5pEB+donAu3gjo2TdxUjI6Ieq9zlVIP9H5LnLW
	 +OsqFJth6eYQ0eOXQ3gZDSK9/RbQ94z0V8KXKzpsQv8sSfb87t4iblopOf1ynjFov61kH
	 pOdZQA8CIunWWrwOD3RbCNNPZb4DEeTjqFSeujB5V6dvkVid9sG8GL4zhkkbiJLzi0WfX
	 XZMHQl+kl2TOCNbdhpzxibtL4iOkQw4SGUZogO6/jsA1R+j5lzbXy8DmlxAKLOdOTirLS
	 tYO/fhIzfbPjyrwHP9gae2n7EGU/U5N2iu4qBaBhhjSTDItI3ozg4SM0U9Yceg6iLBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993976;
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
	bh=RzgEu8rJzEIDTNMmBaEmJ3I3T6QgqNA/WO7B8Qf7e7U=;
	b=KV4fjDT7an3EMB36f0WMAG3dL6rPLNKgSRFiGC1rEb1t3LXYTZo/nhNdXHfghNOYA1GV
	 UKThq1QMgiWJmTy6BGD77mjujy9yxRN0F4x60oBO9ddK6Bb88gXd5KCHp8AoMO47vfRX1
	 7ocrQT9rdeSvGg7ZrGGFffoUaqSltYWqAsJRI1lSsVaRdEnwbksLDx6MUcTYrBtW7e/5/
	 OzgKjNFCiEISjY4TEBlc6w7VIL18yfGSdyltMQ9+jbOzbJI7+2X/RbaDpEx4o52OS2HtH
	 JqYViqir6//5pwTtHLbtTY14/WYrCSBYKx6wp/6SFjZW3gqF3F//aob+3wTNZ9jxEUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yGgT7CBF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.67
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C248606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C248606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yGgT7CBF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl3MqjgEaAnDokeSIQaNeIu01ttfN+EUJHCJjfGspFmEM8TNwflbYL36k+FKWvN6t/7oRooO54n3w7CbsQWh0Wa5SWwBZStQOpc2/YLsDVOwuoe3whazNZJN8T5ioNadY3lrVoZn8kTWm4r3K35xxYk94mWOhBElyvChJZv1U4WNDisPxkewF02boV1ivlmH17lN7WwL/aBBKf0bMdxIXzR0bonEOH8s3X2+6/rGdPzqQ1M0N16iiXPlaFh3GvcsInL4Shwn1iLzJ6qpRv6WDVvJHQsFl9Z2lR64XtycrezBcljSc+1w32mV+RgemwHCoVtGsMlM/PI87F4kRLrXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzgEu8rJzEIDTNMmBaEmJ3I3T6QgqNA/WO7B8Qf7e7U=;
 b=Em5oQzz0jcp1hrMJtvKdY9PfhnriAYlVk/VstPVYCZIkjLvjMFPCl7OcWzMu/cWEysBNo3e/oRofgiQV4c79KGdWO9tUmKwWd71qpMw0c4URHaQIdii7R88IJhEjZL8ja5iUliYbQWz6fif7aQYoQWmNPR5GkI+TJgD4Rhyr2wPI/qwD/Rg6nguhyPhkxZxSdk0ezU/QpUXk8VcGABdR5CZCkAOqdp5kK9EP9xFIL02ebhA1jmwYELMIpBf+qft2TCwAPsewgBsmOMa6TsikmyG66lurS5LWpKapS7aycLo3RgvcLkaQR5R5LQvk+UWNZItDDxi68xIjdCoEA2kHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzgEu8rJzEIDTNMmBaEmJ3I3T6QgqNA/WO7B8Qf7e7U=;
 b=yGgT7CBFGi4JT5PSa5t9OZhYzTZr13YmoAPIZLhIt/x4QMq2wWVFvTSeLptB/N+UfGXsI2WtgE1Qgz749wtNc8daORHLO/t7KtRMeB2URDTZ9aL3qmXvpQjIBGbuE/qWPkpLrd3Qnccdehzvt+tVYMV0kbBL2uqw33bploViL5zkST2hPQ+hWfRsIenvc3r0IUigaRCQZMSoItfNKVlDdYlDfAqaCQsEHQXJ0mzj62XXIedD94WSATyFmgoqZDxah9jMBQmnvdlRh8GixOknRYlA/cHhpBpbfUOR2vjjDIgaO3IjBO220N5jAErqUwjodag0lhz8oa0Y6+t1b3T6sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:26:13 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:26:13 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH wireless 3/3] wifi: nxpwifi: validate command response size against buffer length
Date: Wed, 18 Nov 2026 17:25:28 +0800
Message-Id: <20261118092528.516765-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102124854.325979-4-tristmd@gmail.com>
References: <20261102124854.325979-1-tristmd@gmail.com> <20261102124854.325979-4-tristmd@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:4:297::6) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AMBPR04MB12334:EE_
X-MS-Office365-Filtering-Correlation-Id: 732f1c13-9fff-46d2-51df-08df4555fd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	IK6/3+eJam1FBTIj6BCBd3JQz13faDUmZhip1sTZqDYHrQ7NDkzu0aDyjAEBWXIptla3E9wymGRWP+ByxoWcQlkEpM0GtKWBhqoPtQYXXFl4yvGNLIWwmtnBSeuVuoT8M0Rh1emaPxC//+vAw5KC4nMwXlmmazJJuR+e+nTYIVDnbm8+hXyIp+8+1xRY0FeGNWN2c3kqqLTjKYt/DipIE3NidTouPkhzlh1auzYu4NDimGgclgQSFuIZnHGi+4qKjXMNtvmCcB289mUbR4di30bH0AMrH+iz4U0QeqKDN+gj01ZrBOOckNLKgtKGcZ6bfuMtN+SCcNi05cxjBaAG4QpLzlIpxStzdWuq9hJY8G7dEZyP5gJHtn7nkaE9kV4z8+k51QfSeuPDnO+CwWpdsE2qpWpUVOAQG8W57VHvEXxRomatI04cPBLdhOXfBtMV/Utn1bLywnvchL0CVPv9IsG3zOApweWIhg+msKY0+LRbc9QRF9V46t01Hi4NPKlxrpOD/vm/5Ezexd3ig7j1dBiCcSqlaQfgvZvOrjV8M0Chp4KjQ5mpqO1m2vRrwqIF2+fHVp8uO2XXlWdynU3W03LqmbcJNuWXPtp1fZipw7SBURSpszw5seNECK2Uup4HG++5h7jgAjbZf62AkVcgqfrYRaswTArhoghcI3g/3ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEKsgLX28/O5xCHK882uxfMG5Xf/3bpsJc/bBu21H3fUO8Q32pJuGpEqNqWE?=
 =?us-ascii?Q?q2jc0oOiOyXW+eB9P2XSBkNXy//3yNwfEJlGCtzPouYiidlwNLg7f5droTNK?=
 =?us-ascii?Q?AbwYo470EnJp2hbWtdf/R4Gb81lvNpOQVwBs3dXzRkcP0BcyzAKq5pkXsUDf?=
 =?us-ascii?Q?ErdeVTGXZtbiH5SJalA9YW4hIUtGRO7B8n10X1kKexv97KtFPQF0fMEdBHG5?=
 =?us-ascii?Q?mpTo47SVzri2f5P5Y8vU1X5uiVJ2PQvayTAl4AC4WVDfWtXAWh9Pfi5ilqPq?=
 =?us-ascii?Q?M1r5IIp0MjmKPZ9TfUcffn8nBiBnVhxG+SLhg5hPpKKaAiepJkMF0C/890CB?=
 =?us-ascii?Q?oAv9YKM0+KSpY2B1GeyIx5xiqkJ88O6ld/j+THMYt/WXysr0WUZnuo2fOUdL?=
 =?us-ascii?Q?nMtUCCnMSr6+A2e/Fwj0P8BqPlWc6TYUqD1uHOoyTqNR3jVq/XxHJOuxIPb9?=
 =?us-ascii?Q?h9C66dB4kvQOQ92lJVurUE9UUhqeZHiUaILdroslZCGCnYxkmP/Yv1z/5sUu?=
 =?us-ascii?Q?INRTt9trep9Mmjpm9A0oGT8BGWI4psf5SvkP3Sz6g47foro0XzeqnG4YP0EF?=
 =?us-ascii?Q?SWmuK2S+AmT/j+JghbBfIc0o3eYIpukWlmKlzCYASJonUqahVXAcbf4DUfJo?=
 =?us-ascii?Q?W6b1MQ0HkFmP+Ab43Qs9D7Aa07FZWBm3eT5tXwmeatzD7aj2njAehpXm/vYe?=
 =?us-ascii?Q?2nNUA8NqsCgwNx2AgwTjmbRyS6opKTgG9YMaCnn+WkN1cDnOakUpWi2yHnnI?=
 =?us-ascii?Q?od7FgTZJFzDNHA2eOyLE/G2ELK1eJV29V9uqRgswgOHfo9G7OZsO1qdn1YYp?=
 =?us-ascii?Q?zQlJeYi5UhvtSqU6PGaw5PWu+rG53rUpcsk6CCuBlap7cYKkxyWpAAbwPNnZ?=
 =?us-ascii?Q?Y5n7ycu4Pma5LSDGDjUqzd1dOtjZJXE1xUyHmMfBOHHRwsLDDFGFz7vVGbbL?=
 =?us-ascii?Q?vi7XbT+Y8pS5DE+DI2pZjVLog677/is/WgOd8BfmezwWp1QgCagDXRZWJV7m?=
 =?us-ascii?Q?RTssAlMLGvcCgW5jCyuptzl4SPFy9R9SfUNHX9d00PvJGvuzJlp7tW9TlGS4?=
 =?us-ascii?Q?r4EYU7AGBu4jXEv5zKdZaUYnlpAuIJsuAXV0BUjGYPVlMFY9m/owP/I/SA2w?=
 =?us-ascii?Q?qdBFuc4qrFEPpH0XEnZ4HVqUUwNLHdlBzlwoa2X/38NeJ0aHpnUWJIj+SmYD?=
 =?us-ascii?Q?bdThdy4hY62qAoG1nyCPWLgeJOBL6Bo5gtWl+wr3AYdWM3KIk0GNp2oJSGXV?=
 =?us-ascii?Q?4vbWK3/C56FFvvKQRpqwd6Zb8d4ay13hYe47ZjpKFkVsG0c4/6CwyNBMHOJA?=
 =?us-ascii?Q?ulcontR89NeYiuCw0koN+pxjEK6WooCHqTcFoTnE9hm8oK0KKl4ogJ2gIX1F?=
 =?us-ascii?Q?a5jigTbwXVEZ6WdmUxQ4+bvip9vDCNmU5KSd1IVooyvHpSUCm39qwfohObsE?=
 =?us-ascii?Q?imWWr13n2bpZIQzRJkZvy3stvTg2ps/Pd3cCw2WvcoReteKfQHhL8a8828Uy?=
 =?us-ascii?Q?Nu/M1Itgt/Fexqmq6NfFdAYck2RsXrKGEKqx1E6M7O9VrCBBg6N2Rot9+kcL?=
 =?us-ascii?Q?F+Qob6mYyHnPLiT1YlfnTbghkcwvgFm/OkzSz1s23nCLaNlzdhtz/CptuJWe?=
 =?us-ascii?Q?ZkihAzhjUrbypTe1lswKrNmk4B+2kR69sztP4pFU/+L0NBuMZ7B8xy/b6M8a?=
 =?us-ascii?Q?2v8a6EDzFmseJOjZyNhlBGebWmK6McZy6bZ9gkNCBeFNooTT5FVtcBmrNJzH?=
 =?us-ascii?Q?uJmDLcuAWYlGJHm4AtQp6jPMAhJ8XwgqXj7TrrjeBNh13W3Wfbos?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732f1c13-9fff-46d2-51df-08df4555fd20
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:26:13.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsV+puL0S29070M50gJHP7oEYjeZl/+9pKGeVvt24f/pdGki5rSv9HNJIchwnJtjpLtIKfj74DcCVwq8jk6cQUOp857u/VQhEUer+/PNHLHUIcF8+Lrhrq+ibu2vD0To
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12334

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Mon, Nov 02, 2026 at 12:48:54 PM +0000, Tristan Madani wrote:
> +	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
> +		nxpwifi_dbg(adapter, ERROR,
> +			    "CMD_RESP: resp size %u exceeds buffer %u\n",
> +			    le16_to_cpu(resp->size),
> +			    adapter->curr_cmd->resp_skb->len);
> +		if (adapter->curr_cmd->wait_q_enabled)
> +			adapter->cmd_wait_q.status = -EINVAL;
> +		nxpwifi_recycle_cmd_node(adapter, adapter->curr_cmd);
> +		spin_lock_bh(&adapter->nxpwifi_cmd_lock);
> +		adapter->curr_cmd = NULL;
> +		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
> +		return -EINVAL;
> +	}

This returns before timer_delete_sync(&adapter->cmd_timer), so the
command timer stays armed after curr_cmd is cleared. It will fire and
set NXPWIFI_IS_CMD_TIMEDOUT with no command pending.

Please move the check after the timer is cancelled.

