Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292839;
	b=mWd1vjX2SZaXHcU7Q7xq2hXzD202j7tK5lxfRVH+wYiQjno16K9Eww848Nqt2x8F+qDS
	 JXqFCZ9AKHC5KJeK3+Mq5xQ/r++c7Xh0hoPmZXwJbu28GmusR4GrTPIXjKlmEnlxEmoG4
	 JKdI9pizVj320ykCa1/cQqNZyeaFTzT8fnuJ0B7+WDPAUa0UkllI//gf4zcmgp9o96hZZ
	 /HFIQrP8I5SLJSs0KfF+AGQAeJsmpo+aQ+ZgKTCyRnNlOKVMglVbcISyhs329PhuLaMh3
	 v41MaWiOXlpxtQY/WOmXR0/5LnwlFxuCmcNtdV55CBrxetMc0waTVNFXsgxdzsm5r7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=;
	b=1h0COXbmU7QJ3Pbrbxt7vMrRvbB4T+bMwO1vX9sL2wrEeN7+VsKE/t3p76S9PRDQ8ffI
	 sPWlnO707RHzYiNnPthX+RWP0VSlaTNFZVY8+Fr/4zoOL12FR+TCEJNNHVTILMgWQCmXn
	 Fj42MHc5JGIQD9GGXYKE4tP5scdL30pp7TXp+2cFLS/wnJrqJAfjTJu5hcYSBKkW6Sq7n
	 ATg9J/V9s0JUgiX6bUQWrO9TjopcTRA0ktFvVJvIQSPqg3EAwFNTXaSpWKrPIIjvwFGpn
	 amwB3BzYvB8rQ+hp6RTLjlDEjuDoWNIrrLzfi/RSwxrgboh+18PZQxict9vjcAveBQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XvDU+IHn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZ6cxpV3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F89606A338
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F89606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XvDU+IHn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZ6cxpV3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ATWV2920120
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTgOBxclfc4OU1cpZIIkjE
	Xj00n4/iKo/iTcmsLQabM=; b=XvDU+IHnGxI49hGLmy3UByDLM834ClTs7oa6T6
	Ho4ZmSQLygcZYDUO+6xpS9zC9yBFaA/Br9bd0c92xyfhizqlQLT6MpHaLTD2aX5X
	XSWKcgrKwCMjRVoUs6Y5Ka35AhHDE2+n2O2+cfyRAO7IJ71BacxXz9bQwd/V1Gv1
	oFYd1EZzuIWtDguYfEaG7HO/SAVzzzemlOkZa4YXxNr3syf3ZIXrMLutICnowOUj
	8I1QIsR3VrxIvMj6PgxunEhTWw3mD9N6XrjL/9laypHBsREc+bTOUssFKpyLcUK8
	0e+bufct6kEvbYBFaKDDCMifGcbaIyRggzVU742oPREX49BQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg24hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:40:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso1643953a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 22:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292837; x=1794897637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=;
        b=HZ6cxpV3KZqueko2VNqda0REO7xLOY9hfcfQG8cE03+URVOw4VrU9I+UgRCmEOg6c1
         U57WDTR8sKvPNfp4hl5JsrclFjoqXhr9+Aqc2tXV1QJdfo6/g/1H2KaPkI7eH4bEEJGp
         ZavbnI0FfS/8BQ2c4cPkW0gWroLDDaGMlJDt1U+JdKdjKJCNTFB+tSHCh0842uk86VU0
         s+OXyqolbB+pysIlgnkRHjpR7PxFg6BMEtTidD1EVxA+FMbUiWBK78XcU4HUWbigPIuP
         uzuy9nI8FQaoZGf740l+7uJgM9yyizPUTGKMeyyeBs+9Wpb+vFrExjG6xUjhVqtQQESS
         EiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292837; x=1794897637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=;
        b=q3IzX3avMPL3yjAfT9tUVHfpjtC52lfYXdG9Oau1dYt2vveXP/5ZKxZNl80u2Mbdy1
         bQoB0OMf/61W7Lz/7CdA0Ir0sz+Qj1h0YMBdCv3u+3/OwZKQAh1LCXlxZUTm8WCMMFx+
         L4t8RHvWHZX/mJv6hkcNk9VB4WFDYlRzrmDiPIQjcdvF79p4TbePDx7/HZRXY6VeOqOG
         nPSXFv79MZdxWfOudAhk9pSCFfJGCey+eeINKlMhtlQKrGJO5kjwxoZqVWfOUVuA4mIM
         DGWFUc3gCMM8b5Sf08FnlplwqLtoSYJE5INs/0LXFM5i7qaQ5sAArUwtOHBZl8lCppGq
         VwMw==
X-Gm-Message-State: APuU4Z8kjn6c3qzrXLu7VXnC8XD7sOKlJMhuuvGkv+Ih0GMBpqMyFToW
	jqJKZRPK8rVT4Cb4qJi1zdxBovDrHUErVs3ET9/0ngyKaZVvIWwljG83rHt6n6Z/rV1BRcuAG8O
	US9U7XAABWZ3f5M7WRNVz5sZWdS7xay0ke7Xvy8W5sYpIyjynHjLSxr6i6BAIaHXofga1f/PPzT
	43sA==
X-Gm-Gg: AYBFou0VcLK4KH4nwxGJVqhCfeAm4tAqdaaZ/bAV6nJ7TLPsCb4GQxrQxXPjReO2v7m
	atJ/awUDha6MFfNFrgXnHq4N8NsdqSHqKULePSaURb1AR8ksrdXA0hkRDAT5c7NWaHWvWtZvMd6
	xOjoAqs/X4KNprLhiEjHaD2inow6sumeMcxikxpEdwk0/ywx2k1z5gzC7Kglbhkwt+JU3904FfF
	F3qUUcf1vUcArkMVARQ/l2lUYzqk9zToqmgqJa1IksUUeHGHJsMimd/AEknWWH674GuBAe8SmUR
	N2JvIS48+MCBD2hjBgs1PexdQwZ6X+1GO3/D/2T73pWDUwc/XQuE20wBEuiIIHlvmrVlihy9pUn
	YCZXy6pCb7thilW2PzfRxzx4pDiLx4LWhiUvY4m/hhmiP762T3bQR8kfIMy8V/FdzUYIMq1eiE0
	sGYglgFkj1fDP+W9UWM4q75UCL+x1HNw==
X-Received: by 2002:a17:90a:e7d2:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b166cae9b6mr2064524a91.26.1794292836828;
        Mon, 09 Nov 2026 22:40:36 -0800 (PST)
X-Received: by 2002:a17:90a:e7d2:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b166cae9b6mr2064503a91.26.1794292836276;
        Mon, 09 Nov 2026 22:40:36 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:35 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
Date: Tue, 10 Nov 2026 14:40:21 +0800
Message-Id: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFa88moC/3XNwW7DIAwG4FepOI8KGxpgp71HtQMQp0FNwxbSq
 FOVdx/isF7GxdIv+//8ZJmWSJm9H55soS3mmOYSTm8HFkY3X4jHvmSGAjuh0XC3joBXPqVLDG7
 iU5yv5YQ7GlAZMIjkWSl/LTTER4XPrHT4TI+VfZbNGPOalp/6cYO6r7gB1cI34II77+1p6Ah6q
 T9Szsfvu5tCut2OZVR5w5dmBTQ1LBoFSVaDdBBCQ5N/Gghhm5osWug6Et6YvvO2oamXBgKbmir
 aoII2Qge01v+j7fv+C+6fW/W3AQAA
X-Change-ID: 20260728-ath12k-logical-link-id-aef2481822eb
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1gIjHHGKMlN+
 L1T2fHcpT2kbEor6vNIXasiqtT+rI/uhTWyM0l1tgLmSeGHvjh13kLoXHCb8RNzL1jPELOtqRVZ
 GgqPBsPfimwBzlqZijV+qte+RQAhb/dxApMuuVovXUjRnlcYUOGeC6xIeyZW4TncLZbpL8MS8QE
 MRA+uZX0OywNyAoAem4nzE7H0VaLU/eBu5Oz5Yj917UyKUdz+/HhzHq6UrmCsh2zP5aOPSq8bSm
 vJsHNvxQ2OOPKHaBw2mHmzeP3vwkaEESm8u/8UwxboGP7TK3UNmPonxFHfvzBNRwhA7CkX7pJ8n
 F+QF95rFpJYJeNI2hc8AqQcliGwH9cEkkub1PygUXuFTPEvPDCsAc7mI+NmeSlW3io5brWSWiQf
 4cJiH4oBSkbsK+epJFYqq/SayiYngDVundzE4nXqDhZvy1nGpx+bWlguNwkWFutBa/IHabpMr7K
 8GsTDn4L/0Pqugo1rkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX30kbNVhTJuMa
 PsvmMlOBMXZ9S2KYkEinpbENL2YGgZDfwt/QuNAUsDTp0YXDCJVnm2mOI5tZldnoKmzYeRdecrU
 Bank4Yps6alIt4sssD+c2FMx21gTCMg=
X-Proofpoint-GUID: jOKewwAr35-lovXFC3CY0ninvqsrPrgn
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bc65 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AaJ870xVPVGd3DHDvMsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: jOKewwAr35-lovXFC3CY0ninvqsrPrgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

ath12k currently relies on hardware link id to resolve the link peer. This
works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
throughput on WCN7850") tries to fix it using peer_id but actually that fix
doesn't work always. From user PoV, current code has datapath issues like
EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.

Add support for logical link id based link peer resolution to fix it.

---
Changes in v5:
- rebased on ToT
- collect tags given.
- Link to v4: https://lore.kernel.org/r/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com

---
Baochen Qiang (11):
      wifi: ath12k: fix potential OOB access due to unverified hardware link id
      wifi: ath12k: skip hw link id match for devices without hw link id support
      wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
      wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
      wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
      wifi: ath12k: derive device id without drv_link_id for single device group
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
      wifi: ath12k: allocate logical link id on host when firmware does not report it
      wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
      wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
      wifi: ath12k: use link_id_map to resolve RX link id for all devices

 drivers/net/wireless/ath/ath12k/core.c             |   1 +
 drivers/net/wireless/ath/ath12k/core.h             |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  18 +++
 drivers/net/wireless/ath/ath12k/dp.h               |   1 +
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           |  17 +++
 drivers/net/wireless/ath/ath12k/dp_htt.h           |  15 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c          | 170 +++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h          |  26 +++-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   8 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  16 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   6 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  22 +--
 drivers/net/wireless/ath/ath12k/mac.c              |  53 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 112 +++++++-------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  17 ++-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   6 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  17 ++-
 drivers/net/wireless/ath/ath12k/wmi.h              |   1 +
 23 files changed, 403 insertions(+), 142 deletions(-)
---
base-commit: e3485cc885b81314c814a43db2255b1f9100928f
change-id: 20260728-ath12k-logical-link-id-aef2481822eb

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>

