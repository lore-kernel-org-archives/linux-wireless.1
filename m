Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794486485;
	b=ZeLMvumwkGZMbf0I1wltVRt/dzLdMmimXHEy9aMDo1k1L+JdL4fAUKQXjg7jX1kLgTwU
	 Aru24ITWRR9l9JmhNKvY/qwVL73agHkHkCaHYfZe6KuHImYAId42aUPjkaR9K1J8OaRbu
	 ubBUnkKyMin0anfA6sBGzOOXnMDEEBbzeRIr6cEWHUHgKiFQmHOzIfvUytfQkmfObnT1l
	 K8GRhm3628lT4RFk1biuvBggJrXjk8t+hMi76AUOp+JrfHNnYJoBsbScdBX3EidlGhSX7
	 1vAChXtTN27eC1RzVNfgrLhtpXsaArIRclj7GS8kSexBwP/IF802YfGYceghdPWWxwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486485;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
	b=3C67OWChDapbmlna2x+QGhYWhKwtrr3sHhw6KdItptfdkniLenfMmFkCH9O80q/LWnPE
	 B6OixVECsmHiWKQ7ma8bxblx8PKR03FB0rhUI9JxwIsyf5evdvH999zzeD9GUE+bLmtjQ
	 dFbqCJUQHVq6LpqmJevnv3tp63mUjFUTxsEF8vOcs54goZl8k4x2J7tIi+e2oJ3nMZHQB
	 szuqFR0pthrFobOpwJ1SLC8yH6R+OhXLs2PplXp84UWkaxmdjCFC3BiBWEaP7aWakvdMf
	 TlwH5OFXIo5UhyHyZ3/LRA7SR46DAtlbPlOc6QZdVW/OLiHkSqcEz/JttVBJyte++9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=lQ7B55dH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968DB606A884
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 12:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 968DB606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=lQ7B55dH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl3EswARyZXHHOQsI6VZL3CYvjIdEcsEasJzLyfWO6/ZOhSIgkuGD6BNue78Ws9qbyDnPvrx7P9UC5dTh3Vze+sEYOdVCca5jTvQKoYh4GVqDQEXYlFEdLOk6TCK1ZiWf6zw0chVMqwNHFxcPfEo7ln5QNMPtFIwUe9chGrRm6f8FDC0uPwXjGFxy57+1rTHq2YwWUQFkZl8b7hPNFhln3tuj62IPWQ1m16xkO5XM6UCcznXMq7s5mrUorKHHICOD4chK6ABrz+8KbPIqoXb4IPyQ6zcJA6WlrLim+msTin6BFX3Py0X4ECNyR4WLl2m7xaqM63Do3Ik9u4Ct7ebMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
 b=mqwYZRFRNywPUzEVBUlRvW+/ESfjl6TIP3dHxlriMhbOXl65ncRunWcJuoKL1pwXiDyMx1+GBw9JmPXWAsROd4qwINx81RcNXZlFcY6rac4BndNrQ2DIKlwTM/ox3dNEvN+dABeNHHF85iiRZBQuR7RXoimwcgcIvBy7JWGOHpEBRGrHHDruH7w3UrdgdqfD3K20azDz/NmrYT683ixJCeeD2OvkbPsQeRFLa5ZGoYXKXwaZVIFr+ODAXmu1yWnkpI9jUeoC4OjuwZCQlPhS8rsZaUxnzgOZRl8LlcJ8qCdT9xyArnJm97YAgBhgv/Ci3YF4QppwowgjuuI5MoJ2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUWK25Zxj2RdQC2TG/5l3DQZ9LGVS3MPG6T9CpM8oTA=;
 b=lQ7B55dHFK+N1MKfG+d2uVyfOwljwK83RydQ3f4aD1JGUs8ybiUr51SlW7pGx0RCHkM9xTcF19lWYl48tfYNTDFUjnw5l/tKTUwd/SJcfETvKeydJU5RQvT+HMcxoh8uL5ffhwghIx8BNKMNxd06ogwzjzPpLtzzLFOUytd/52k=
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by VI0PR10MB9498.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:30b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 12:28:00 +0000
Received: from MI3PEPF00008495.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::2) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 12:28:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 MI3PEPF00008495.mail.protection.outlook.com (10.167.240.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 12:27:59 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id RRyHxfzSLf0UDRTuJxbDvQ; Thu, 12 Nov 2026 13:27:59 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id RTuJxJvkAbtn9RTuJxUxdC; Thu, 12 Nov 2026 13:27:59 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 13B69180398;
	Thu, 12 Nov 2026 13:27:59 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 0E0F0FE023B; Thu, 12 Nov 2026 13:27:59 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: linux-wireless@vger.kernel.org
Cc: elb12345@hotmail.co.uk,
	francesco@dolcini.it,
	jeff.chen_1@nxp.com,
	johannes@sipsolutions.net,
	kees+treewide@kernel.org,
	lilinmao@kylinos.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Thu, 12 Nov 2026 13:27:53 +0100
Message-ID: <20261112122755.183585-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
References: <20261109170400.1316239-1-vishal.gupta_1@philips.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008495:EE_|VI0PR10MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: b02d06a1-4cad-4375-20c2-08df40b8636f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|261102123227099003|11063799006|10067099003|56012099006|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	eekiO2dxX0ExlqDXmclQGp/XOfF+EuioZqwKvfwZrNjhm8tp4t1+3pem/4JpGl0s1AGYazRQqf6I4zg5Fn4cqQKeRxt3kq5yuIUe8Zw4U7sYSEeJs4w02KotUFBl313tIz1Ybls9YzFSOM7IWYdL/ME6rdfp1xS1jjUPqpyurreeQitjFzS7kj+WJXygdPY8VWmex0AIn8ibOx9MRq3knWtxQijEHDJE2En5VDuj92ncfZyGuu981q/3DTUeX2bmTRGDcfvO+cW4rrX2rgoBbmnVkhZYYSJ/xKYErb3ibvjVzhKQCQMyiMKkZOKVUSh0GdI7Nl8qw/6X/Xsbx4SldDQL8wO6xYi+rlEYdRFYBQXyoCM1tX8+vHGz+9k+nJaKHiQe1/J1lw7niFHpEsAVhYTe8P0vFADESrvhes6NXDgCODOoTdHj9mjx4gPEmQa3v7CK63wBYscrtcb4tmkk7MWUkNZZUYkhy/Xxy76AlL4PsBZC+PJrYVIPbwzgdRyY0l10YDvqDvvVnrI0IH8Cjks38siMO7/0Ts8fCPU8P/5ZooZDZhWn23UjCZbIMM9UqzNpAEAQv7FQy0ie4Dkz47+QQIPuhysFVDU/pCjAo1gjvra5LIx11/ynAZRnyHcz+kfF2j5qnLdlxKXegl3vLxGdvnxcxuyyx23U/sYVIwGb8KYuLpLne9sZm1Mn5JnijejN3JQOOqVhRX6+0hLrtg==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(261102123227099003)(11063799006)(10067099003)(56012099006)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ys4rzVSRLkZtCaQRCqDn080+LLhT4abpZMRf9TMZR5EbrOEp/n5L5QD6OFJ3Lyn6CAvjzcVrYmSssKAPDVYt5EkQdW6BCprJnqvsEkhKYdRodmtgAu9F28lHnpjjpX3hdFJxBsOrZwwJSQx/xbFJrgs5ZYGyXfGiWs9vSn85J4UTEcNGU8tMyT7Zq1gBQlLiHo+eAJszicFYV3j3fB7IaK2f4kcyXsEY5jz2sougczJ4wfvOpO6TQ7KWjIG/hq8xWnArgQpXA2SLcn2OP0lntm2E429CBWTSLIMIO0KzysMY9UwsqqdgpJpmU3KrW0zKnDV30ni1pu4/1BxOvJdwLHguqiGuBvQ+4KQBDzv1ZHCmWxPP7KulSsSp/kyf01Hbmg+3EyGguV4DRa9Idgpvd0RhCajXjSYODoqqvz7+RUKhEjY/gWrPks4WKb2AtzRZ
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:27:59.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02d06a1-4cad-4375-20c2-08df40b8636f
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008495.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9498

My patch sent on November 9 is visible in the lore archive, but I can’t find it in Patchwork. so do i need to resend?

Regards,
Vishal
