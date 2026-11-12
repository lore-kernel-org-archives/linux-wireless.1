Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482797;
	b=GGvxESzanrR/4nThF26p4pjI+Ojcto/barTPrO2a7K7pvbwQtGIIzr9m+D/hTDDTxttM
	 7zl1qpnuNAnJKKQvRNNqT6xWWTzRXnd6mZz0vLRySo4Kip5Kp6j0k9GQkKIa02gfLcD4l
	 /80xPk8OTu8qyfojBscFEzhZJP18ELaAS3X3vXbeoIZ1hHGS1UXIb+1gj52B0g7wiyDGn
	 N7szp+uvdn06tYpaShioMAKCrMy4QTSul8+kUJHBJrl/0QDNo7oimSkJkHv7/B1aY83iK
	 ncWYbYBzMOhDVNveS7rGNHhHSbqPd4gBoX4DNOb1TsdY3nfFumXSoyLKcEfbau3mJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
	b=z0qkgWwNAB75eUK3XjEXCxnPl/Rdow5GkaqtTAgxVAR3Q+21wPOnQj4ktNG2T5G2k+eH
	 OohvNl4xkgxvHPYic5nTMPElLTgOudmuwU2+AJG/Z8QX+aIwflOURvnZqUYENbKaQO8Xx
	 v/mNbxCY0Tvj5mcq7MP908Nbmk/s4TJ8ggB98i0gXTU0sA5xlUsRcXfsASbLNqin/iS/W
	 NzQFz39jxkkt93Tq1cb6kuXvMJnaw9EnSQ5pvktKZuOHAxNItIuMQ4fmbd22+Iy2O+FMm
	 on9Mm1aleuobsrRgecA7ECa7HNpmbluCeo4JmgfO61vC0os93kgdatATkenKfwPtyAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUy26aCm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMWsCoIk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73D60A260F
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C73D60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUy26aCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMWsCoIk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUUoB1629167
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=; b=SUy26aCmhmq3Pkmr
	Y7uWGVYMI1/Mwo+Vx5LIuuU1vM5Ugq8n5v8Ia/7kpLOGSZ+OnWkmZBrAU6DH8yM6
	1xnuw0xD0OCj2lDfDksou5MrOMit5VNwb8cnnocgFK9NHleqpnu1Ap7jIkwN7UPQ
	V6X5WPDKWwxKzZyZBasYVxnRzgRUwHm6BbQWZxojbaOHQwNpB/nrBC/zSjUHb6cv
	dyWb8jdhOYAkSW32VzySUjDZ/ixFNsEerCMotdDmZe6L89jMy9BqceqEwbPnCnEr
	1WSXmd37wiDYehni+OcTj4tRiGiUT6FIbLuL7Cb8OOGvciTufXEo182wgOmMmQqT
	EAOC5A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs005m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso1197485eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=KMWsCoIkM15PWOJRtF7E+2Ptsqjou7vdpBCx6vrAla1U9iwiZ6lAVWvEVP2Z2jaj3b
         vkQ9b7ytplJPAiAXwSsTYgTKkjbKL7haOGA7zHYfO2AvziMrd+YSeLpV3pL7Tw7bJaJk
         PKvaXHJY4F40mJWMm5RYpaeDgqD1yOEGbyb7NTSBBSiQkvsMiar5zaKDSZ34HzYFSteR
         bucehmbbRcEbq2KKlbPNO2optdzrMt6HP2rQh4Lj/VlMAMGrmUOukZjPWOYVKoaVI06B
         UReeH0jXyy8YJq181GNk6v0Bsla3c2ZUoyIA7PVCjUlI4IQdsvBV5WBzYjklL1teFfzP
         n2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=wHx0a7nnvDE3HeSn9ngTc9p4PaMhC6aWZvuId1QK4saY25xMSQ1teSew+Jq+QkLJfI
         oQ8r62BsJp6MztVjrAI2DAOV02PskOb2apxWMiOSB4YOnf0xmePLBIJJkluKCRpawwgP
         xoQXW7R5GooafiYMuoibvjj5U2I+LICdQ6hl4e2F7lkmf7xdumVtkSUpl3fNzH5RtFIL
         O+yXgZE1loBXqxk1e9PTBXZ2xCO6WMZb61c4nASr7D4tpPHoPzqp5LjAsJcpppaRDp60
         ctuxOR9p9xg5klAEdZ4j4qWOdNiocpi1uLwD1BusP9l2uaoTBCkbXr+YBXva7eRy2SDw
         vNKg==
X-Forwarded-Encrypted: i=1; AL+hErHZF3W8mJPMC6ltKqMTBehvs/lBgaq5uA9IyE5ab1C8owgQHVbhe4YSzQ28VEzfGn1bkhdc+Eh90aWMjButag==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JZN99u89/7+YVTTMFjaj93I/XCT/TA0JyZ847gXabwv8Ztvm5
	5WkeZ2eTbZczkTv9u2rl9z0mmFUJ8X1QPdvAAjpssML3AL+jHSmTKWeaJsZF2igrMWS96Sr3tIc
	E3Ov6pQxm/L3Va57rttE8aDJBrslI/aRzWM0ctPtWH5jZI2g0M0PZhyITpU568QS2aq6+tA==
X-Gm-Gg: AYBFou2sWCWB4Hn1luAyi5MtSuP/n9TyHpGOGCtE+G0fTOhV01PmDf159wqva6Lspqq
	/B+8TsE3mI4h3LH/y0uL9d/9dhnBSuzcV342M9bLdy3wt1/8p+f5eepaVaJxAw8NYAUaTVzq/9P
	w420AvO3m0JU8++WJRSVXdOQPMlCw2ZQF+A2kZuUH9Es42vGo14k9tvGYnr/WktJ4E4ira9SuCP
	/rEfdFz/mvW3mnLx6sLuo3QRaMzt9hZ0kb6f1Oho2GWfuz3JBmvw+UxT0BE8cV0s7QNlZtBf/as
	gEZFBxWUSBPxKGzCLJjgw9Vyh/yw8SBFRITCF6jBhofToMEJp7fTQ0KA5R4nKxyclstK++MQYYM
	vzx/yAHg+bS3xiK4HRTvsjrHHIEEUCQ2AAYjuk9KHPOh9Rr2dAVW278mzRuLeAuKSSKqdIvl1B1
	gtpRE5p6prxsf8dc7m9liSGxw2
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250870eec.13.1794482794576;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250848eec.13.1794482793875;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:04 -0800
Subject: [PATCH ath-next v3 05/10] wifi: ath10k: hard-block the radio when
 entering WEDGED state
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
Message-Id: <20261112-10k-sdio-crash-v3-5-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=MWfUEvjZr46HYMaP11xduek9QR2GcZgTmlqW2Hg4VCc=;
 b=G5l6aC6zo9pxETS3U2CFCijsxu592zbVekuDs5xhEm9El0qxvySyOmmJDB8y/qMfkimIN+cyc
 q+IbSHt1ZJUAvY/Ch2Qdh19Y8PqEhplDl0ZHI8w/ae0F6C+1vDv+882
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX1ZzrICZK1Gxk
 JCNdYnhtJwgPtCuHXlkzRwYC/95htPuj1wdXtLfOas+//q495N4FuC1KGyjCBZ6nLaNFFxtJ63u
 DkSdsmMk3V8/xycg/qJSiwIdln6c+XFDjNWFDGOiFfBn7q87lpjMMOwpEJKOu8wrlYoRoPG+X9Y
 bY3QpyHeCo2oRoXlyC4mJ552wnBH3Me9oPag9/eV83jYbXfMWnBqmEWH4xQG2nFOYJAxu69SO22
 aVdBP/nHqCJhEo0KpjyC8858s/mQ3j4Owu1ErjhOwNljyQ2g4G0nTZLlJDnsxgaDNsSPsXBZYAL
 6AqOOK9POdHUixIfGYXTxq3TcX9BTLd8NiOD2P8JiH8z7FbPAHhvPa6kR4TRg973LWiAXopVqcs
 P27a6tL7CWMLwSb4ndhT6/mNlobDgemJvP0OZ9VUPD4BnaiYlwmkg8KFqvS+j+5TGDPmX67oFYZ
 4UpYF9ZsrNXhAbKg/uA==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5a26b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX9voCabFn4AXP
 v36+rAr9e5JODJ8pXvsOdPtuII52FWboigIL0YkwO3N34dNDj+zmYu34vqKupMoHVF1DbvpNzjM
 GnVfqnuTQPorXtc4X5qWtJrNHi65+V4=
X-Proofpoint-GUID: ggZp_FASALlsN5rC-gauve72EYNmCFCY
X-Proofpoint-ORIG-GUID: ggZp_FASALlsN5rC-gauve72EYNmCFCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded or the system is rebooted.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f6b6b81a4896..4eb91efdba41 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1

