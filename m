Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171720;
	b=e1N1VGNtPQiA71EvqLCzLFeAqLKG5k9x/BX1JrmpRSWn0dARYllxKOJQWd65xDiLApYj
	 EKpAbiU/x8jNJY+jFifVt6di7Hmst8Bgh4zlafJC+krSO16g5lN1B2jaYsJKs/w0B31IO
	 /8IkdPqZemXGL2grdOy3gkI0lMkUUWeqYvF7rV/41x0tfwF2/ytPmPgb0aQC8RpoR+o7x
	 3spANM830ODW+OPEOAfanHvMAG1stf4MZ8hFluqlypH8K88A7J2rSJQaIsD4tIpybDwRq
	 gEra1KK20YzUbWYSsRKXC2Mn97wul7rKKGtYxWuus5E/Yc64ZPgWHDtEdUPCY9dGkqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171720;
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
	bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
	b=K/jcV8FbUgxSRgviQjma3uE9TitzA9+pToELL1p5QAAN/2IBGPvmYN9J0X6t5sxouKS1
	 IMFidlKf2gpoiHj8p+VU4W8Te5FTABsyq14nHEZj5/x6MPSCJ+H491+iAUOlwBoL75LEC
	 AzSyhNvB9ghcetuvD2uz0TAlC2Eu50fvfhE3qgjFwz9Yl9W16BSTa6z4TOhxPFw36Fg5h
	 llq/qU06gvFdmlSV6xMH6JXvX0mFsBJbRvnkUs3btNmRoSF2T2f6K94YafdNPZ85R9vt5
	 TnavDgpnLSOzd/ezF8zPtxVxwa4ZWs1B3Gqvf1l3QmOeBAfWGn1QKd2M523q49nNrUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=P1Uz81S7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.33
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14625606A333
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 10:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14625606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=P1Uz81S7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dujr+DRQY9WDApFUY+lRr2KwdzeHgBpSAkQs5BVWAv6U2MWUG3fCklFOgZjg87PpHwvGXG8Cf0pv6NKDqy6zROE1HtpbX/jgPAY/mey3BlfJ/fkMljeGPAtnT0KdKMhPO0zxS8uYu0IDzIs3JSetX0U74/VBvEPVy/gknCl4sdpZbuNPFzNdMOb0cZHkVOKUl/bGFBk1XnEWH2gN2XXi7akXczlwA/eWc/LJLE5XFnT6aINpZgBQa1jYV4VuGEVn7+ChZ+pTXDH5owVKYm/oLATSmtMDmhEqZFrY0cTCyqlIP+cDuaw59RsZGEW4Mje1RyJ+VMp1erguaczIV7SGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=eN9iddBgclp0TYFw0fyepXnqIcYRKz5v8cw98mQes+8JYdP8Xj5wm/4T79/oGYXbvOj+U+B0baES/jq3BcEMQ2Vr/ymHp7c0kUIBZgzEU+WirYNlnPJma+kgZYTnV/HVn7hN9r0k8Z3sTLcObdk/yk6chp3Z+QVxiagQL+vJZRlG6Wcp4/319JZ/iryqqH36HYp9ntWbNcALpzed2IiWtv0bxB8gFTJceWk25AFR8jNSARa8UDCK1BeykEpWNjMOCCRx2w1pLT0tAzSlpNAsjrlpRXS8+VfcU9PzMoQ1wBzcC7WLIYETBUCg82k514jag7YUI3Y+qWlPK7JCFKngdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=P1Uz81S7Dc3tdsLiZbkZmDJKJA6iugmYuasuFIarnSSTqHRXzqa0UuYcRhvPBnjjbJBfRE4V/1HkSwCJGmHtvhHPhAPWWnFqLpDuHu6ZJgVFNcFAk8Q8IZSA4n/C9L0abm9An1vyapvUAgwBLUWAnzr/qZipwS8JIjxf4Nn6wuo=
Received: from AS9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:488::31)
 by GV2PR10MB9929.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 10:48:36 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:488:cafe::82) by AS9PR05CA0026.outlook.office365.com
 (2603:10a6:20b:488::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Fri,
 20 Nov 2026 10:48:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 10:48:35 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UARzxpEhhf0UDUMAVx0G3E; Fri, 20 Nov 2026 11:48:35 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UMAVxTZA2btn9UMAVxpUQM; Fri, 20 Nov 2026 11:48:35 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 9177B180025;
	Fri, 20 Nov 2026 11:48:35 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 914C0FE023B; Fri, 20 Nov 2026 11:48:35 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: vishal.gupta_1@philips.com
Cc: jeff.johnson@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	uwe.schnick@philips.com
Subject: Re: [PATCH 1/1] wifi: mwifiex: synchronize scan cancellation state
Date: Fri, 20 Nov 2026 11:48:34 +0100
Message-ID: <20261120104835.8055-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111143037.688461-1-vishal.gupta_1@philips.com>
References: <20261111143037.688461-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|GV2PR10MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dfb3c8-f40c-4b5d-98d6-08df46f3d41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|30052699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mMYuwflwVCgQxdWynf4uU5vDC4Yzw+ZlN4BQeCVBrom3uBdfpkaD4THfTPS219aKC8lPTgfBiDLWV6LJvgeZDBg2D+SeT/N/vk6RT9rl/m+34pmwE1n9xwvTYbaRmkTsguEO61HnBYQeTJJEkvjbToP8hzPkqN0+tPAxS9W5qQDFIjrj9iiQ+xqDBd+NeXHBXiuAloZvT/Hi16CeLDQtEWSy+9Q7PQtTOFsPsenBkaH6kA0cY5uOQNXCdeTaGewKXGyfnTy/Fd6EhOVOmFOMruPcprI5E5efwUgXA9oJlajnYG1mtkGLfWjIp+nyEOVpX70LXbA/pUev5XRjBzAbBcyZR82QnzHpMcgQAMHz3WJ5+JOO2XTN9+kG0tD3GELybPCXwtcWfsKoAmarwLc3DDmtNx3kacoQQWpVPO5y4Gz5vsuU+xYgdpCY64/XEKQ9X78OIYOdl9c5Kh664Dt4FmN/PWafTSDBHtv6Hcn0549lXpPMEHoncURNJYZlvRcn/fXFFi93zD3B/Qcl3sfe60tRHZRKKKLEMwQDyVCZs490YdG3umlhnh448qfKu0cGM5sHOoEL3NpNqS5iaXC4qTRYms6wx7RlMHWJ22fBO4gQ4L7W+k04lxg2pu6E/1z8G4kChnI3pkn7JitRIGub4zvlIwPkfQWv8dd8AhJxyXLV2dHeZXJTWdHCAdRBJpIXq0fCKtni9XT8oNoFusGiyA==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(30052699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y6NZNzEqablqOygsrj5yoPJrQ3TJIkf3mdCzspyj9fct/Ax7sgQeIcAqe4QHNw6Fhe36SIn4LpNr49CzyPZeJe4FclMMmN8pdkoyvIUKohVrrOoyfguE4lRUbjlXRN38ReiGun7acOuUtH33D2B1RFP7eYYXeLOXUl+i6kWbHjiro03hz/t8Dcg6cPnMm7QAuDpvO58ufPia6C6b4uQawcZZlR0nFqGCJWmaU3rLcpUnvTpOm2ARJ690dZUA/4PE2LoOYCLycge9Hmefz6KyO0D0D19oa9dDayiiR4Crqa+4Q6S1fKXymhCr7fWqMu3ZA9X7JwYxF/UY//AyEadbFXiUek60+TETGHO1JK8dvLOUMjADOP8OCqXVfOW54Q6zZjTLJl3GLGHaN2XJZHpqkAZSQS+ZepcocMSXSD9ff5120lhUiO885FDQSzq4XZSz
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:48:35.8935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dfb3c8-f40c-4b5d-98d6-08df46f3d41a
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9929

Hi,

Just checking whether you’ve had a chance to review this patch. I am happy to address any feedback.

Regards
Vishal Gupta
