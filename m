Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970562;
	b=hT9+EHUwclDQvrJd2WqT7ekOnqSX4jUHLN1j+4iLIDh3JPnGbdQwug0Lc/MLeGUWk9TR
	 nA1j6pc+V6+KSlhWht6fReW77BEswGUNXgKe48gjW5x0QWx89hurAA9uPgO+scOf07ltc
	 c6QDd/Hg09aSryZ8nzbDGmlJvvCWEIdCm9FjXwkFa78+F+uTHMENz25LkPcka87JHvlWO
	 L/OmSWyzp2Bxexkf0RiHeuZOpLllN6DMdo4RrBkFqbrt310AsBzdLmU4IdeRRCw/LyXBq
	 lFhFU7NLZpr8t2PabFPE0Kz9QaQDK8jfUXMtCb/EuVeDe2gKKJ1OXqlreU9IEZ0YTVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
	b=BEa/QYAuAVacfiqf91ZU3VoYk1LYSgROQkVPM9WNr4066JhbpbGQxuXf/G0HaJzE2B5R
	 L5RTQSqiphYFwpXtcJNLr0bumJkUNbMVOUHCn0JhSojzKX0uUIi5evoaLIwMI3bydDdLS
	 5sDHAj1oyGx6ECyCi+0Br0C4XqPY51nsIzUr7Y6UivT1ww/EinSVYyitQrXdRZTxz6/MY
	 Y0Dscqr1evojEqD74N2eF1fgSeIcbp57cTIFXU9CBnR0otPYBpvu8Ydnpf33fOaPI0np2
	 odHcHGvkbbG1PWmJYkCruqPEYjvziV293e3LGF27siMsuXuQQUzJTxgrbCBo+WcnAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwOL1vfC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl8C0jjh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA3606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwOL1vfC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl8C0jjh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Up1w3371295
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROhIVQAuyVs
	m7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=; b=YwOL1vfCa7EjncgYmA1gq6QqOcj
	A+JtBQ9mZpVnpNGsz7WHFfSE7eUSGocydHl8g+oJ+Slfy6UshYifok7SG69nHTX8
	LDl9I5Is1wvxc8vBHbHoK2cpBTyBU2YoAkX/0oJWzK+PRM951wEgBFIePTYcqNX5
	LnEo3H3/1TgsoBA1WJ2VWrB62e0t1GZserMxYtCVvn9ojvWKMcV5WzkeouqV8isX
	XmSwqdXfI+mXuSTt8ehmxDUEqBNXBIQ1TueAoXvJiTD8/AU0iAHcTeqSb8xty3WZ
	5gG1keJBmhnlm25FjXEK1kVyBoqlaMUGF7eFipNX8aFc5a4x0rYkrlMPiCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rty8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:56:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so4264085ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970561; x=1795575361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=Xl8C0jjh7NKiLJOz1iAGf6DEo5+cb9ARHE0GKkQUOAGTKJvbBXQaYArkw86FHT7ayG
         U88pJbjxCeigv/KpHkq7DIkTvTQGD3J/hsMhSUFv6Ro0Wyc4xBks6XViY2MVV7VaZuTt
         aKIGRz/js00grsGj303K2dlMxlrQwC/tDa5k96PtzYej5C9bSjadr+CboFYWVQs+fuSP
         mlgDRqsNKheSkjZW4KplScjwrMHJPw+0E7c+BEw5KMCVmWvmKX9KvvlpfgrK6In5S53f
         NdZYBYLVLXbievGf/pNlcLZTY4jFyYHAsYsYPjXbBw8l44d7liKB4fmKDq6Z2wxVJREQ
         GbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970561; x=1795575361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROhIVQAuyVsm7jnfDHXbjk9s5qf6FIyHLvPIz/JeHhc=;
        b=RJmgdk9awLl2UqPnrn4hGjVrBuGEHX0IZM8/4u54ySF3YHXoRfAwLKRRTPaxmv9yxu
         lANMoQ9iswvyysKdxem1+93vmt9WV0wlMYzsaQOJOs69yd32UCrbBlqbtazoXkhP0hNf
         riPQn6mbAfFXdxRXM8T8gbBc+eroM0BDN7IJuJcMNUxn/pymPKz9FghmQJds0Wo3tmX3
         3hx41OhFUwye/pfrbJrHNl+kLzQt9BduEdBhmYshIgqlCoIgFzmXxNnCQr6QT5t+axPo
         oOK88nR5o7vkXG2F6id4n2GUlRAt3jVuCackuJc6KODzT/q2rxFiB81/kJkngOEn4F72
         tg7Q==
X-Forwarded-Encrypted: i=1; AL+hErHR4XdLDD8N6qNo20Cy8FJ5ooYtTLv+B470sjJpSFgX7kjAuiBLC/ZvadkQgQ1/OJ+y4i89+aVYRZ7uit83bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pix1GlnlADRvQU2g4na/VfKMTz3+RaMIkyDXBMXxOSmmerNOx
	gJvLtfuUPzJuIpNX8lFT0//9hGaFbZx+3+i9xWF/97PKlRxZfdGqROKxR6zYfHzEmCCAt46C5U/
	QlfD9lKIx9Rqc9LpEfTHqYqQselSjD8RPMEGmQmUBb8sfLh8qAHQ3W1J92x5GGJC1wwslDw==
X-Gm-Gg: AZFdTZdvJnW7K3xNk7t7zhdyB1gZh4nIS0rCr6U4+tusOO6VtkBpnzuOeVXIODmpSiE
	kYc4MekaZW3EB6FNDznruHrOLfcpueuQEzQlAPmJKfJStDignjAkGLuO+MtHwXa6QHFgfXFDCCi
	9796P7pLbStAwT6d3PvAklZpulUmcTHjCZih5wBMUZF41d2E1fe1x+JnpHI14aQ9vo8JFSS0NDz
	Uo3R3P8Jd/pPvk7JKKXC0jpfRr/tz9ua1idw7MqRWb8CotKvoNOhSxaucWWz32UDeA3UzbKg2En
	/aX3njrH196mYaheXFnpBKxHCv5YX/pfZOt+sjqk02E1czLP1fI+gl9Hp+WNTkARNjvZ4HGzZvS
	mF6nuSC8h13j3ri/frsPl82YojljY1FBYjVkTjOQI59NPjTmEntBnT6Xj4OXgddpuPSdc86VQsb
	6R/VkyT/hNcwHsHQcQIfDjZVdOft/RIxA=
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546935ad.29.1794970560762;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
X-Received: by 2002:a17:902:ef47:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2eff7403e84mr11546725ad.29.1794970560263;
        Tue, 17 Nov 2026 18:56:00 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:59 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/7] wifi: ath12k: add WMI response handling for MLO link set active command
Date: Wed, 18 Nov 2026 10:55:14 +0800
Message-Id: <20261118025520.39269-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd13c1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=se8-P38KO_-aJsBOcBAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MYk3kRqLMQjruH7CwYBM2usmN_dPZhlW
X-Proofpoint-ORIG-GUID: MYk3kRqLMQjruH7CwYBM2usmN_dPZhlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX0oin+tMEcBvD
 4HdWqJNMtzaB+SEXQcdC7XO8Wfs00qQEM1yY5XH84PODcmRxiJptGXYDoU4zYN+cEhsD9KeAbEc
 mLt32zA4s3jAzdxEWX+uelQ02FitBjjlwYtMR1PqWf8lMfoFQnZf/YQ1HbrSGBv9ywiTPxRqTXN
 sFpDstnRlKpE2CJLU7Kt85RsvcyQ1qFq9oKZJsaMuQKbHluHlkPBC0R//g9HF7phLAobe+zwkdB
 T3E3hRJP6Gi/DFzxrD3DcM09LV4tw8J4I/wXeHXNNMusArI4jfad4OVTRIp2syhfv+PCmoh+W+y
 EAO8mzE1Zqt2U44yrT6cDffW+O4AD08wnQugxxM/tD44Sh5b8xaekQW4MypPuMMwk1dnHxZesXl
 Xn1862c2xYIbPvcIH41U/ivN9yrCk9RDMklbr8ORxUZupHNuPlZdXnu97TZeRjYYuXF/SD+zne2
 e/kfH4Nw8bSrynRXY2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX7yvjBMjyjdfL
 16/4sc6gSsdstpT7ujaHQpbn6f0KITn+pbtdqD62aQDjJVVp8j5XBl/Etmf4GDxEXerl0vNucrt
 FhnmLfaYzXKZs8Xz7KPAr6g6sQwQ+eQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180011

WMI_MLO_LINK_SET_ACTIVE_CMDID allows the driver to tell firmware which
MLO links should be active or inactive. Add parsing and logging of the
corresponding firmware response event. Delivery of the response to the
sender is added in a subsequent patch.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  6 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..dde7721182af 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -209,6 +209,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_obss_color_collision_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct ath12k_wmi_pdev_csa_event) },
+	[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT] = {
+		.min_len = sizeof(struct wmi_mlo_link_set_active_resp_event) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -9710,6 +9712,37 @@ static void ath12k_wmi_gtk_offload_status_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_wmi_event_mlo_link_set_active(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	const struct wmi_mlo_link_set_active_resp_event *ev;
+	u32 status, use_ieee;
+	const void **tb;
+	int ret;
+
+	tb = ath12k_wmi_tlv_parse(ab, skb);
+	if (IS_ERR(tb)) {
+		ret = PTR_ERR(tb);
+		ath12k_warn(ab, "failed to parse mlo link set active resp: %d\n", ret);
+		return;
+	}
+
+	ev = tb[WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "mlo link set active resp event tag not found\n");
+		return;
+	}
+
+	status = le32_to_cpu(ev->status);
+	use_ieee = le32_to_cpu(ev->use_ieee_link_id_bitmap);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "mlo link set active resp status %u use_ieee 0x%x\n",
+		   status, use_ieee);
+
+	/* Response delivery to waiters will be wired up in a subsequent patch */
+}
+
 static void ath12k_wmi_event_mlo_setup_complete(struct ath12k_base *ab,
 						struct sk_buff *skb)
 {
@@ -10504,6 +10537,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_GTK_OFFLOAD_STATUS_EVENTID:
 		ath12k_wmi_gtk_offload_status_event(ab, skb);
 		break;
+	case WMI_MLO_LINK_SET_ACTIVE_RESP_EVENTID:
+		ath12k_wmi_event_mlo_link_set_active(ab, skb);
+		break;
 	case WMI_MLO_SETUP_COMPLETE_EVENTID:
 		ath12k_wmi_event_mlo_setup_complete(ab, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..68dd13cafe51 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2016,6 +2016,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
 	WMI_TAG_VDEV_CH_POWER_INFO,
 	WMI_TAG_MLO_LINK_SET_ACTIVE_CMD = 0x3BE,
+	WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT,
 	WMI_TAG_EHT_RATE_SET = 0x3C4,
 	WMI_TAG_DCS_INCUMBENT_SIGNAL_INTERFERENCE_TYPE = 0x3C5,
 	WMI_TAG_MLO_TX_SEND_PARAMS,
@@ -6496,6 +6497,11 @@ struct wmi_mlo_link_set_active_arg {
 	struct wmi_ml_disallow_mode_bmap_arg disallow_bmap[WMI_ML_MAX_DISALLOW_BMAP_COMB];
 };
 
+struct wmi_mlo_link_set_active_resp_event {
+	__le32 status;
+	__le32 use_ieee_link_id_bitmap;
+} __packed;
+
 #define ATH12K_MAX_20MHZ_SEGMENTS	16
 #define ATH12K_MAX_NUM_ANTENNA		8
 #define ATH12K_MAX_NUM_NF_HW_DBM	32
-- 
2.34.1

