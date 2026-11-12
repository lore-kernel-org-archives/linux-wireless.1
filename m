Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472422;
	b=1C1/2M33uZcC9F+qlP46BSn7sJiGyyF75M9hNajhwxqhpAaKcqcrihSr2ugw6egaCcyr
	 /kJKzj+mf6kUvyyMl6xHb7m0BopNeVc4UZbtKMABIwgUHsz+w2/+rUahJfxtVCklCeIV9
	 TvnLK5rvleK7Dp2dmPpnn3/FghYWF2r0kHRvgQtv96Ybl7LaqYxFClz+TDWacGnYYQMBd
	 pyp2cF6IsXteCs7EcirWN6xScyt2eXiXfXdjvJpbpcZ9a4ix+XI1ul2oCMU+nPYXvotow
	 nih0glsH5R4fpH9R74lnzef4LuVBym20aWNwvIXcPvUBcN77TwdzyDLOG55/Q3YQe6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
	b=OAZVIIQzasstRyfXELwTQvi9uSZwzbkqKYXdRKVH5tRD5eWJNOVxlflCQut0z30RhbIV
	 nCixaWPjrDvsd9jwEITgig6ZnMUZGtGGjEXOZ9OopZ/oHPmN+nvwjaTyWHEULIvcS+J/K
	 Z+J4JTMctWQKPqp1TEIIqQmQVSmxQjyOe6+GidCg+uLzAhqoFmIPtq8HY5l9RuORZTQ74
	 hJUiexjw0inQvE5aAZL+4M6NUg5PejhUp7ZyQ+VDOeAjTnWXi6r6hHK/1cfIcMQmEf0Lj
	 sCtd4UM9bLqcJSZIt+vxzNZhtGSj1xGtOC8VMWM/z524nfybJg5I8RPpJIZuGrKmz1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdjY9OuS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XelfCXiF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE95606E9B7
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE95606E9B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdjY9OuS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XelfCXiF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfNj3812887
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=; b=UdjY9OuSvQm3A81k
	05cL+rGaENhnUBUtacA+EpTYh3vzW4TRXM48Dp0DqmBrTMot8rWrepuLxNoN+6gm
	eJGJM8puKjezRz1IHTUtQw1MSxxfh3bGh/fLtHVXRWoHBaWP2gc8X+3I+ZNboNoY
	aWVMErVNDLoJGlrqrR3GAsRgEjyk0g6CQW/PiAJOrOxtYTBWNDH2cqWHLTgs781g
	5B8iXQyRq6KjiQRhOxqSbbGZEx5I6qmTj49tReKwaY0FVKdIbmiocT1JOL205GSj
	686TSYXBms/+3a+aLY0j9YJA9VWVtnMhJhLnVvJQcsGtMomtEWLzJ81BKJFZTOpB
	Lk7tPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0jyaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:33:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3173093a91.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472420; x=1795077220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=XelfCXiFsWEswIRpSCVcgt6YL8yhicYbLX674gQJudPKSYunqA9fuGJazpz1XnNka/
         OCsQi8uxMA1onPIc89f0XtI1w7fuZLLtH6bl833sSts/+dbu+wiMno00BZCYfCkCZA2A
         rhV1bwFnykdwfjjJaHG8Wv5e6ZpVoHR6f+MC3hmvrPXb44bKTN/FK17n5EeGAYO6X/rt
         kUWqYH3R+kmljua6RM5rrceHyiLGxTj17move7MGH5xLjkU4TjwF80C/F4tJIe0sdBcR
         6QOLbPT+PYpJbq2geyGM+Vw/07KMbdqlrXb9y0bwz1XyMQaGN1E/mFOXixh6UBbNlnNG
         A2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472420; x=1795077220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKagoEKwzFpEtXBpwWpll6XqoO1Wg1TyP09dixsoz1k=;
        b=HfuqYguRuMRXD0idNEaRdFTt2CWftTxHJZQoYxbrD6o/qp1XSbfwy0gJ/cdDFpQGFV
         fLlWn4QRllNQQymfiAPKmEegc+p1gtAxItSn6YRkWW935mGH03UkwkJZOpgPVpl/iyaC
         DvVveox7wuoXnkHcgPeO7GsBUuLTXaue2Ld13I8HqzXJVTqC6CbVh+wj+iQfGfjc2uuw
         zGxD5T1nJy/pzV4/hsFzQ85UPwfkGt0OOBrj0UMuVFHE64NPiYk4jgAtl6IWiT3z+1CC
         T7nkQ7bFrHLO29hoeAHxBvtE4IIhnaSmO7mneOuDk/ngGVmA2aDfJH0U4LLq2Gm34b8t
         kAQw==
X-Gm-Message-State: APuU4Z/zwSDYLTNfm+3ZYF7mvcw96bm9LiirYP9M4A2y0eixpJBsHj1s
	9WhxFhquc0mqQ30waAlWhcuScCUE+GCIA7gh2/LeTkzxDmxY+IVFzFlXmsa89zQDNOwU3bjHih6
	Gdh8sdCVrVQkjOZNLX7fDmgfaEpxC6ejqSAfOGAZlvzDidwoqv/VfcPN7zgvMqZT+esxrng==
X-Gm-Gg: AYBFou12QpvGI6a/EhLKS4riY6LatTbWKo4SJu2ynu/Dum1P7DQNHkXEsjH/IzvGRid
	hmxMljksmGoqnKkhQqqXoU7uVOtPNYd4DY1OksfQSt/it5mcWJNtyQP0uyXjk40x5WxnjoNj6ut
	T5X8KmI+Mn4XL1LY+W5YY0xDXh8V5Ki9uCGptdR5KoP2Q88dWdxpe6uRoePHWI+CXjT9HCmitlj
	JvI8CZpFwkoCroIk36rgL5D8o8o5R0qCacnsJFtQE0eLEhyC9Xa0qc397dNj6rq8kFhBhTkzdMX
	Nue0nLMXiqOrlwvn84vPAb3i/Ri2EIf3pKCgpjdXCK5yHxXpu/1aR+p0D8gOawslwVbQiTbscRi
	T9uW9cMoH//fF7USwVZvJmglVmwyIbX4dylzifxQWs0d7GoTVesiZTKOEFqs9nSbUDC+fn8T+5o
	GbYBhekxXGfybb7+crm/RUsXW40tVxeJnMtkLgNlLalkPbucVRtab8529yNKi6ye9yFBExDSKg3
	Q==
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525569a91.26.1794472419899;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
X-Received: by 2002:a17:90b:5487:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b182eac822mr4525548a91.26.1794472419328;
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:39 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:28 +0530
Subject: [PATCH ath-next 14/15] wifi: ath12k: add and hook Wi-Fi 8 mac80211
 ops skeleton for QCN9575
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
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-14-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: YHhMptT0IWEYrVUW8MegOg4wDpfNhK9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX99y8A7ip214e
 Eqv8Du7XtR0F7jZck5IyyUKriFySq52xwH35C1jizlmibN3G/X2zoOqVhUGQvTQWyc4SEDS3hKv
 l7/u8JDAZ2FI5uBB0hR7KRoJsK/gZXAsuPWqBGJTc4v84Rpzh44SY4bEsp2Ybs4zCp5mGYq6ABZ
 60jYFZv7bKNKrkBtepN044wRfsh5qJDnQ2M180E1nCKVMH+FVA9TCb1i1ShHJyMFXO8b4iY7fJo
 FM6PppYhMhZPtzkQLv8DERBiwEEH9CtkQcEYDdnKSU64SncpW8u5G5nJuEH3g1KFKJa6LmURAfV
 aKnKJ/pihiZKD7y8n98pGB8I6oFM6dgK+7Wpv0zLjXhK4JaUppr/vjDLTc1Bbt+0PT/LgbDyzFb
 943nitFHb4JAZvuF/Oiiy9zmqXVVOtPG5wgQIFRroDEeyUolW2KZuGCiK17hEj4QiOsv7RzG3M4
 hwvGBlHZClvSjcG6zAg==
X-Proofpoint-ORIG-GUID: YHhMptT0IWEYrVUW8MegOg4wDpfNhK9X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+kUx3VxoMNiC
 an51dnIrv7MyfVKpO3h+BLSoF8eVE8kspxJGVm6iqRnBa8za3buFrq1nQKFvP6AhlGdCSeN4sVL
 ett4KFo7RuAirxtyeQXUgJLbvS46p0Q=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af579e5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qlncVs5R31ZIVvcfge8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Implement an ieee80211_ops skeleton for QCN9575.

Add ath12k_ops_wifi8 in wifi8/hw.c as a dedicated Wi-Fi 8 ieee80211_ops
table. Introduce a stub Wi-Fi 8 TX callback (ath12k_wifi8_mac_op_tx) and
reuse existing common ath12k_mac_op_* callbacks for all remaining mac80211
operations. Hook ath12k_ops_wifi8 in ath12k_wifi8_hw_init() so Wi-Fi 8
devices use the dedicated ops instance. The stub TX callback is a
placeholder; a follow-up patch implements the QCN9575-specific TX path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 70 ++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 92c897de16f4..30188f4fae02 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -10,8 +10,11 @@
 #include "../core.h"
 #include "../ce.h"
 #include "../debug.h"
+#include "../debugfs.h"
+#include "../debugfs_sta.h"
 #include "../hw.h"
 #include "../mhi.h"
+#include "../testmode.h"
 #include "ce.h"
 #include "hal.h"
 #include "hw.h"
@@ -152,6 +155,72 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	},
 };
 
+static void ath12k_wifi8_mac_op_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_tx_control *control,
+				   struct sk_buff *skb)
+{
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+
+	__ath12k_warn(ah->dev, "wifi8: tx stub is a placeholder, dropping frame\n");
+	ieee80211_free_txskb(hw, skb);
+}
+
+static const struct ieee80211_ops ath12k_ops_wifi8 = {
+	.tx				= ath12k_wifi8_mac_op_tx,
+	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.start				= ath12k_mac_op_start,
+	.stop				= ath12k_mac_op_stop,
+	.reconfig_complete		= ath12k_mac_op_reconfig_complete,
+	.add_interface			= ath12k_mac_op_add_interface,
+	.remove_interface		= ath12k_mac_op_remove_interface,
+	.update_vif_offload		= ath12k_mac_op_update_vif_offload,
+	.link_info_changed		= ath12k_mac_op_link_info_changed,
+	.vif_cfg_changed		= ath12k_mac_op_vif_cfg_changed,
+	.change_vif_links		= ath12k_mac_op_change_vif_links,
+	.configure_filter		= ath12k_mac_op_configure_filter,
+	.hw_scan			= ath12k_mac_op_hw_scan,
+	.cancel_hw_scan			= ath12k_mac_op_cancel_hw_scan,
+	.set_key			= ath12k_mac_op_set_key,
+	.set_rekey_data			= ath12k_mac_op_set_rekey_data,
+	.sta_state			= ath12k_mac_op_sta_state,
+	.sta_set_txpwr			= ath12k_mac_op_sta_set_txpwr,
+	.link_sta_rc_update		= ath12k_mac_op_link_sta_rc_update,
+	.conf_tx			= ath12k_mac_op_conf_tx,
+	.set_antenna			= ath12k_mac_op_set_antenna,
+	.get_antenna			= ath12k_mac_op_get_antenna,
+	.ampdu_action			= ath12k_mac_op_ampdu_action,
+	.add_chanctx			= ath12k_mac_op_add_chanctx,
+	.remove_chanctx			= ath12k_mac_op_remove_chanctx,
+	.change_chanctx			= ath12k_mac_op_change_chanctx,
+	.assign_vif_chanctx		= ath12k_mac_op_assign_vif_chanctx,
+	.unassign_vif_chanctx		= ath12k_mac_op_unassign_vif_chanctx,
+	.switch_vif_chanctx		= ath12k_mac_op_switch_vif_chanctx,
+	.get_txpower			= ath12k_mac_op_get_txpower,
+	.set_rts_threshold		= ath12k_mac_op_set_rts_threshold,
+	.set_frag_threshold		= ath12k_mac_op_set_frag_threshold,
+	.set_bitrate_mask		= ath12k_mac_op_set_bitrate_mask,
+	.get_survey			= ath12k_mac_op_get_survey,
+	.flush				= ath12k_mac_op_flush,
+	.sta_statistics			= ath12k_mac_op_sta_statistics,
+	.link_sta_statistics		= ath12k_mac_op_link_sta_statistics,
+	.remain_on_channel		= ath12k_mac_op_remain_on_channel,
+	.cancel_remain_on_channel	= ath12k_mac_op_cancel_remain_on_channel,
+	.change_sta_links		= ath12k_mac_op_change_sta_links,
+	.can_activate_links		= ath12k_mac_op_can_activate_links,
+#ifdef CONFIG_PM
+	.suspend			= ath12k_wow_op_suspend,
+	.resume				= ath12k_wow_op_resume,
+	.set_wakeup			= ath12k_wow_op_set_wakeup,
+#endif
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.vif_add_debugfs		= ath12k_debugfs_op_vif_add,
+#endif
+	CFG80211_TESTMODE_CMD(ath12k_tm_cmd)
+#ifdef CONFIG_ATH12K_DEBUGFS
+	.link_sta_add_debugfs		= ath12k_debugfs_link_sta_op_add,
+#endif
+};
+
 int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 {
 	const struct ath12k_hw_params *hw_params = NULL;
@@ -171,6 +240,7 @@ int ath12k_wifi8_hw_init(struct ath12k_base *ab)
 	}
 
 	ab->hw_params = hw_params;
+	ab->ath12k_ops = &ath12k_ops_wifi8;
 
 	ath12k_wifi8_hal_init(ab);
 

-- 
2.34.1

