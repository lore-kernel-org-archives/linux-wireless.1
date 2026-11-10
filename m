Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285200;
	b=PBCwnf2OG5sszE4JRXA2k/Mic/FHmlIIHT8QVSbF8WN2eOnY9HoDKua9HvRDcnZ1gen2
	 bTRJ/NhO01xxRT3RTIaHwhQjwA4mNvpMcgmrllZo6JapqPxoWbnLfKKvt5TM6qyiY5B6C
	 vjMK9OUhGqwTV9Rf/hL6eyG57yGn68A/mtOGyLbB93wh4TSLv0VIM2R5maqUwAVZLq6DG
	 VD+Ytadmz2DXvFBXErtcwVWm0+IrdO3mpWTy+JBp1GdJ9LgxK53F00rIedQ3GF6yaraxf
	 DALs0WOa0+HXFcwvL1E+nypE0XRnHTZ3znoHcxZDBuaPtrSZkql6SoLMHhgjUuTmk5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vBYwuBoogdMRdMR77EGklkU5tHqYJVVaimJIv+t5NNk=;
	b=hZjKZyoi3XvY47DILUCQAa2S/+VyuEe+KIvJeYOUv7BwW+Izz5b5UI8V4k5kLctCM6VB
	 ymWEGcdtPHBVlPhTX36nluTFDXoh8vlYOnMLQTPs+yBHiKpNrcqsqzLivYVDmJvOTaTS/
	 bBU6MsRpBPT1O05EU07Ky6+ZDL9chfNyXJVoFfI11rd73J1Xva/8arLzik/t6JdeDcpCw
	 fTRw6MYfk74cm0XYdk6YanDV9Il+TQi5UBJPgpjQpVcfYbh7vo/Q3/KZ4GcyEAxojdKRI
	 ptOiDqG14f2IiHDeIiYF9vDa646S66b8k4aP3sPXPDJIjCbcFe/9IlCztHX4kCpFWtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=akZD5Gzj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBPOqj0k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067860A263D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6067860A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=akZD5Gzj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBPOqj0k
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4Aat82929011
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vBYwuBoogdM
	RdMR77EGklkU5tHqYJVVaimJIv+t5NNk=; b=akZD5GzjoCt+6TyNLF7zArSyfrp
	SQIP7D7uqG0YjA08xa+pKR2npFYT2XdjZ2rekd63xO8CffUYC3AceKYYkbcZ+z+4
	QsDi6QFHWxlXNJPlht7LWZM+obgWxI9Y1a+R/XkGwtP+hI958GpxNTR/kMUwbPxI
	zTG4Vc1ZldsSfVvVWxcjcDeUPqriaj1WwJTdH3UOvqwITzaUGueOUARhwJOuYsYp
	vEYc3Afn8ASC1OEzTwqKPYYAnlMRMpPvJx9E4tRS3VppgHoy0tmDh7i2EsYDokYy
	Svq3BMv1HW2Dmwtwwe/GC/Y22DnMG9snm7pxHHygqb5lRZouvccfz7Et5oA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82x4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so2557987eec.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285198; x=1794889998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBYwuBoogdMRdMR77EGklkU5tHqYJVVaimJIv+t5NNk=;
        b=GBPOqj0kBl6k7TQEC4iPJ6HZBMqP6vYKbBfu4sk+mg0Wfbm1e2pJrLxdqWc7bE0YRa
         1yxvpxXr7OgASpyyLRPxpwb6gHAx/47cDgxbbWjPfnGgXCVjI7uxDVB/LSgQtnGNBrFL
         XOLAVLNc7R2hulDfZGD8XLOieTyLcn1z+B2JZS1pDuzIkIl1IlluCkWJd5fM30T+Z+OY
         sJGdzdTG41j/VVxif+TxL8/yDqtj0VCwAGg8aG4z9Xqse/fN47hPrhdREV1aqBorAGDo
         uVTn9yB1jspOUDrXJQmWEkkMH8FdsKnN0ZASZDfpmxyGjKVWET5Oa2GNMen9Fql8U9Os
         X1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285198; x=1794889998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBYwuBoogdMRdMR77EGklkU5tHqYJVVaimJIv+t5NNk=;
        b=xBVvd+kZ09Shp1htZCiBLY5f882XuO0ZrcXZlBMV4SvhGKTU8uvUEkl2v/+NLAwoME
         0XqJW5VePXIxjm4rqlrRH+X5CO2TQQ2qw2lLmEtikYhWjM3NHnXkPgiPOzsC0rHOSNTs
         TrA0C6j8L4NJcgBapT9gLl/Bp8qmrZFyREkEzPrOw/r3bf+j8xODLJojoD0TmYMbUMyA
         RG/HrgiJSwX5Wwg2WiHRN0QgUmRPoHjVMWazRiUHyr9sD/darnTlin8jBBWROks7u7+I
         3sx5MHDfPlZYTffbQNF3PEsB5uVrpV6+V6h3gXPUQfk1MtFNzLjSwqo1keyNPPiCtgQo
         0Opw==
X-Gm-Message-State: APuU4Z8GvWmUiiZDcZ+xl3JiFPgDeUvCemkQ31n+tVhILRQtVxENNCgI
	ToXBIV4fDGpWKTxnHF6FEoLMtsu9NappSQRTOQw0/eQAbb1n97LonnHCbqDXslImNCsV6Oz+gc9
	af/o4nB+uYNiYVSz9uem88Rv2r/Z0nwSuSSR4KrLqdDiuyjeZQ1T7JHvl1xhsqSxd19if4g==
X-Gm-Gg: AYBFou0zyJLpMjUuQN+im0pvZNSikeiQnW8BTZOgQqbSwsk9KwMrL8FduYCcw6208fl
	qosVhtGlpkd5SfDOoYKZq2soraHpsOmE++OuF3kFwb593WHYqBGNeDln1gVYH0WHTk2bfiVMhn5
	VQo9/HVhqtq5Fqyf4FdPz7144miITDkJh2dG9y5WNu7lVlrrFsgF8SBA5SuOz5eKzdDbSrz5xQK
	C6yuQV6CpEvAB3MfquE7Fu5WFdSlfw/KpFZWoZltkhH5mjjECrVQE7EcPPtf5tQtXWds+wf+kix
	7me155tYsC1s9p9s3tT2R1vDl2apPbyeBRuR/KDWzt/WE6r/vMq2l1rYdJaxBDOBRIlVTL9XZL0
	X8XrbaOkY10NsXV2zaeDNelfalb2UvjRGt/imjWD41wFtS/Gr2m/uvY1v7z0IN2EajzIBckiVRB
	1UMhQDkDj4UA==
X-Received: by 2002:a05:7300:ce03:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-3751fb32275mr1737430eec.13.1794285197921;
        Mon, 09 Nov 2026 20:33:17 -0800 (PST)
X-Received: by 2002:a05:7300:ce03:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-3751fb32275mr1737401eec.13.1794285197300;
        Mon, 09 Nov 2026 20:33:17 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:17 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 08/19] wifi: nl80211/cfg80211: add ranging results to NAN match event
Date: Tue, 10 Nov 2026 10:02:31 +0530
Message-Id: <20261110043242.2012238-9-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af29e8f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=HBrtoi3ke_hx9toI9_oA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: n5OaaaCX0gjVs7p6oyevHAX7chefqYa-
X-Proofpoint-ORIG-GUID: n5OaaaCX0gjVs7p6oyevHAX7chefqYa-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX9Gi75rHqEXHt
 ZWuryMLewPzEsZ4xyWAAPWZ9s+6iSO3It2bVLSlggmH6g2Fx8N63WWoPw+o31s4rfjHPMO3GrUH
 NQKNswf3TD7iZLIxrHmSrMHvME1E+RI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX5HVGhv5Keyhc
 LwrqVCOugRAJrWMi2/6AyIqWhEE5paFNB3K9HL53uduMy116ZKB80pW1405iqay8PTnkSNSyqpj
 TPoUasux9B6wvdEYB/Exdrr76x5Z8eCWXLoiONcMbKH35/ah/JxivY2vWappYZWsyPR3+DefxFC
 Pu4+U6Rrua+NYJFXRKYmlAXg1h5y1CR/SJ6VKpfgyub2+vVyKNZq9lMJv277ysLKvVZWeLBMy2j
 cuAxHwLuACSAGhBQODiwRmsviOD7sdCgqEMdaoXCG2MW5voB2Sno1SPpR6OUqU87w+4LHa6wJp0
 Yid7EF9obumOObLHUKAPwGCWYpjbkncexiGEP9f/yTPcKR001tCuHa0fGKF4ON4Kx4Gl3L3o2aH
 KhGs66y93vjG5p+d8/LBjhLfww3+92AgCE43GY7iOo93SmyMj6LekQwrqvax7RIrQ+L2z3Dzt0O
 Gypka5vBPeAg6rsLgHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Extend cfg80211_nan_match_params with ranging_indication and
ranging_measurement fields to allow the driver/firmware to report
NAN Ranging results as part of the NAN Service Match indication
in offload mode.

Add the corresponding attributes NL80211_NAN_MATCH_RANGING_INDICATION
and NL80211_NAN_MATCH_RANGING_MEASUREMENT and serialize them in
cfg80211_nan_match() so that userspace (e.g., wpa_supplicant) can
receive the NAN Ranging Report along with the NAN Service Match event.

Send ranging info to userspace only if ranging_indication is non-zero.
ranging_indication is a bitmask with four valid combinations:
- bit 0 set: continuous ranging
- bit 1 set: ingress condition met
- bit 2 set: egress condition met
- bit 1 and bit 2 set: both ingress and egress conditions met

Leave validation of the combination to userspace (e.g., wpa_supplicant).

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  4 ++++
 include/uapi/linux/nl80211.h |  8 ++++++++
 net/wireless/nl80211.c       | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index facd5d8bc5e1..ef8c84aab332 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -10638,6 +10638,8 @@ void cfg80211_free_nan_func(struct cfg80211_nan_func *f);
  *	Only valid when @rssi_valid is true.
  * @rssi_valid: if true, @rssi contains a valid RSSI measurement.
  * @cookie: unique identifier of the corresponding function
+ * @ranging_indication: bitmap indicating the type of ranging performed.
+ * @ranging_measurement: distance to the peer in millimetres.
  */
 struct cfg80211_nan_match_params {
 	enum nl80211_nan_function_type type;
@@ -10652,6 +10654,8 @@ struct cfg80211_nan_match_params {
 	s32 rssi;
 	bool rssi_valid;
 	u64 cookie;
+	u8 ranging_indication;
+	s32 ranging_measurement;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index e71db9de3ef2..bc70a8e31af6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -7872,6 +7872,12 @@ enum nl80211_nan_srf_attributes {
  * @NL80211_NAN_MATCH_FUNC_PEER: the peer function
  *	that caused the match. This is a nested attribute.
  *	See &enum nl80211_nan_func_attributes.
+ * @NL80211_NAN_MATCH_RANGING_INDICATION: u8 attribute. Bitmap indicating
+ *	the type of ranging performed: bit 0: continuous ranging,
+ *	bit 1: ingress condition met, bit 2: egress condition met,
+ *	bit 1 and bit 2: both conditions met. Only present when non-zero.
+ * @NL80211_NAN_MATCH_RANGING_MEASUREMENT: s32 attribute. Distance to
+ *	the peer in millimetres measured via FTM.
  *
  * @NUM_NL80211_NAN_MATCH_ATTR: internal
  * @NL80211_NAN_MATCH_ATTR_MAX: highest NAN match attribute
@@ -7880,6 +7886,8 @@ enum nl80211_nan_match_attributes {
 	__NL80211_NAN_MATCH_INVALID,
 	NL80211_NAN_MATCH_FUNC_LOCAL,
 	NL80211_NAN_MATCH_FUNC_PEER,
+	NL80211_NAN_MATCH_RANGING_INDICATION,
+	NL80211_NAN_MATCH_RANGING_MEASUREMENT,
 
 	/* keep last */
 	NUM_NL80211_NAN_MATCH_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f86d593a1baf..97ee36dd8b11 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18023,6 +18023,17 @@ void cfg80211_nan_match(struct wireless_dev *wdev,
 		goto nla_put_failure;
 
 	nla_nest_end(msg, peer_func_attr);
+
+	/* report ranging info only if ranging was indicated */
+	if (match->ranging_indication) {
+		if (nla_put_u8(msg, NL80211_NAN_MATCH_RANGING_INDICATION,
+			       match->ranging_indication))
+			goto nla_put_failure;
+
+		if (nla_put_s32(msg, NL80211_NAN_MATCH_RANGING_MEASUREMENT,
+				match->ranging_measurement))
+			goto nla_put_failure;
+	}
 	nla_nest_end(msg, match_attr);
 	genlmsg_end(msg, hdr);
 
-- 
2.34.1

