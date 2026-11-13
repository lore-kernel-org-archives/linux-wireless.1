Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565387;
	b=HAOTsP3zYNef5KWNJeypC5GIqU1AT/Bqcxo1Ka8nlv1FB7Y5QMmq8yc3Bm5rqY1U7AeS
	 yKR7C4iHWkm4coRmNiieZCxWm9UCQT8TNONU2cwOq7dTHJrT6svrPJWqNIdMmggcGtyG+
	 zJP1dLjEhKOmOv/NjqWpNba5z+7GfiZaushkAdtmuMFdezbBC70cOlYx4IV3CqdvleHv1
	 /8y7+BvvPgaYJSzNto9r4J4vm/sK629VHnpwYloZAMyYv1vkIQuiobzVRrN5sv/OTMDwG
	 /HcEfe37yEPSD07ooitLcQy7vVNvXsoSPqgh1MKBg72cLLO9jNjgkwPSNUpf80s/f3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
	b=MNsEQCeqIXbk7EWo2JMLXg8ILpNtHt9f8Wxxb9SBjLbW2OCO48c5liR1+8LJVesYXJx5
	 abQMFZ8U3n+Z/43oGLp2+20MShIbmj26jjM4bdjIe+rHvglTpyWxDJWKm63UdWGYEH/BR
	 I9iDGjCvFmCeA2Nj8jFNMjanMbKRrRoGucThcqEDESBstnqonUVfIpVzg0zsxb4JIR8DV
	 4tx9VriEiMmWJeLMMhY4QDi7ZRaaLg+5kr5HA30EarEM/GPU5mABXg0fx4fzrfdrVrGGI
	 6y8I+XfiI7a7zs40bbzJQCH4P36Y4vYQGE+X8Chp8sr3u7oBdZ9pxlzuRLqBFh4pG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdiJyMMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1HZC3mv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1DA606A881
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1DA606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gdiJyMMD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1HZC3mv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VKtF2515663
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RaWySxSuUQf
	RLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=; b=gdiJyMMDJWPry82MBt3TFhkef8m
	jR3ZYzLxyZldcE6SfrBe7GS2qO1b6DEvC5Uh9fc8PHsRKQpGASkqhjrnL3fHUR7C
	x66MWspcweIswNZF6IA9TNr5dtUPx2X+T+6zApglJh8wcwG2RyNPpkrsdTxBsy/8
	aFNEeSE0NF6LChoXw3MkWILzZvER7AMRmPaE3Fn1DknXXNaLgRTgASsiAI5yb9TT
	BiVtJkdJm9z8HOoB72mf3KZ+TpGcDmAXIbJ7byjVH/67ssPBsN0HMinZqTTEE2Wf
	2iC1GCOVLwjR3kUxn26hl4wbkmziuAMXDbF4QNPDck4G9yB3tkFRZleUlTQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bbkmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:23:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1020506eec.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565385; x=1795170185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
        b=K1HZC3mvut/Xf1+3YQyTPsYOnidz8z1FRSbKdvpR4gm9vNWd78CHFOwG4MC6S7M5kX
         UuC+dy54KKmL1dLhZVVuv0j7Dwc0YPtvMN8F7/qz994BTYQAg9mb9wl+/WWKGGfaDHjR
         h1OCo/5AVQ50ogTfTpIA4hoSnBWdTTHRWQ7meo2C/lrnqK8+G+6DYn57zMQ7WkaoMeD7
         XZ0esX3NY2Uk1aqeHTuimkNClntgiZkyvtT9Sl14jg4dZRLmMjuAZya45l61NiAXkLx7
         V7wja4sy2MeYV5NLAkfSotct2tyWFvvf75X1yRss7eHKtsV0FwQr1JCz4Mm1OpmAMRrx
         zOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565385; x=1795170185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
        b=i6x6q0Edor58hDXeOTPG0S0t7k8Np7GeFnLsbt8wJF2BbTbq1UNXuyphkf9bNfCBKx
         xzXGMeVne2PVaFOaCQugk9wXKMurGy5lNxExhTkEr6l5whWlqf49RQKesFums+MBlYRY
         3k/WginEnTEvrMUXvnJWJWYB1wY8DEbQac2slQtv9tfmKAxs/1+HJg63mB33Ek8Z3Muu
         fDmQcffTaPjkQ9KYaNt76nYH5v2MyuR0N0RI786VPSe10n8Kv1CuGiycn5PgXR5/125/
         RfFTOkZ/4Wl+m3PiEHf5tllsH3tfYz2p+wmsAFyDIcx4KMZfu+bfBHFd1hQOEkAGIhGu
         GOqw==
X-Gm-Message-State: APuU4Z8TFrv1k/p2YMaQv2n09oQkuU6MhPxwpKSciE2SmNFJg/ORSMFC
	ZxFNQwl+6gU8z8aeXi7kQ9xDzD0VxxJd+G310MCYDBCshwtaMFp8svTU2xEo4hmMSVsuA9E1u1F
	KOK01dpyiCKlmOacFh5Lzsau0XLbUZc2AH7kiOHSwptlfoImDeuyUHgvqAz0OWfrBgyCO+Q==
X-Gm-Gg: AYBFou2qdnOeEV4WAebVpXi/IvdDYwsx0tA7Dj/dw0BQbiK5DkRfZupR93Ew4pey9V/
	VTJehJJz21vT0Lmovrl7HgiNz5TMwKlTZnATnTlpTc/HdqasZ6omLQuKFrIBXr7eKzDscGU1GbF
	Hv+WXu7B996I3NHaHqpPkDUc3j9b3SVdZdsXxnHtCooNQAjSC7BAFU9iiBwHTZgwl1pOtpEazTH
	DvgpYRWyh+puUO9nqiE2SbgnOfJMpBuqMKDOi7sB5gyu91vBPwjdgtkPd2ZRPV3sT5N0quREfdb
	gSJIjRKXfA2D2eu5jtan2nQxMnSGNfUl5AMOVFbm0lsw5NurC0Ur6ALA63ed0ZPb4tA4R6IWCv8
	o6mo106OqqrDmf4WCmkYMfFHpjrW5GNQ5FMQJyUr/wapCb44ZD4F06c9LXzy9+oPpiVtW0AkeuW
	O7iDCkgOn/wKM=
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr1702220eec.30.1794565384608;
        Fri, 13 Nov 2026 02:23:04 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr1702195eec.30.1794565383931;
        Fri, 13 Nov 2026 02:23:03 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:23:03 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 06/19] wifi: nl80211/cfg80211: add support for request-based NAN ranging
Date: Fri, 13 Nov 2026 15:52:15 +0530
Message-Id: <20261113102228.1917973-7-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
References: <20261113102228.1917973-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6e509 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZsUDbAycufZmAt45gsIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: pekihgzvM4nCVLZftJd-HvCQfqtiRoML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX84iBpb0H83qg
 0PFe+MWXXzbTLGZJEJ2v2firqDvCGJaZujz0siJfpX/jsxIbXnZ0LmBLTx2ifgYdrvntkuG4RqO
 xvRtYOOEaAUziI6rKHm4wW3pX/qxwNcqfH9bSJB0fBCw+tg8KCnDLqRQc9Mzfn8/JfUu4RlvDp5
 5gGvNkCeznr3YTp8vQZWK56VnHyO0iJTygh5+5k2RG9UhcjHzzB6gNLZQoeQT5XbgzjzAzniDbw
 1Si6HPIRp3xtToNVFsHuKGO9emc1TREQQ+81boFfXT3WC1Gvd1HMOzs9epLgB1FJNQnMQbx5eGG
 yc2oU95ABF++7xA9LNnShuua9NnAfLI5AoW5PDQ/xKhHpcn/d0Tfle+OOypp05rfcbwtr982V0X
 9A5Pyoa0OuJLPu8iosDW+NWv5mrKij4g4cb1sWztTafkszK+U67hBGOXlQGhvMuHlhjnpjKN0Kl
 mnyVS/Fw3XJy6y0gfQw==
X-Proofpoint-ORIG-GUID: pekihgzvM4nCVLZftJd-HvCQfqtiRoML
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX6YOaH+szwqdC
 EaPjCrzpkn2RaC1RrPMdEJvod5QETv0Et8IFDury0kyFMFqz7EcQG8rsjYu2O/jiY+u+oTqgrD9
 ho8GS6r3sHvPxdmfC3JFJbl7Ie8d+QE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

From: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

Extend the peer measurement framework with a NAN FTM request type
to allow userspace (e.g., wpa_supplicant) to initiate a NAN Ranging
Request in offload mode.

Extend the nl80211 parser to handle NAN-specific FTM parameters and
validate the request type so the driver/firmware can identify and
trigger the NAN Ranging Session on behalf of userspace. Reject the
request if it is a NAN Ranging Request and the interface is not a
NAN interface, as mandated by the Wi-Fi Aware Specification, or if
the driver does not advertise NAN ranging capability.

Treat ASAP and single burst as inherent to NAN ranging. Userspace need
not request generic ASAP mode, and NUM_BURSTS_EXP must be zero if set.

Signed-off-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>
Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 include/net/cfg80211.h       |  10 +++-
 include/uapi/linux/nl80211.h |  13 +++++
 net/wireless/nl80211.c       |   5 +-
 net/wireless/nl80211.h       |   3 +
 net/wireless/pmsr.c          | 110 ++++++++++++++++++++++++++++++++++-
 5 files changed, 138 insertions(+), 3 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index b4a1aadf3639..084e23d2391a 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4775,6 +4775,8 @@ struct cfg80211_pmsr_result {
  *		 @trigger_based or @non_trigger_based is set.
  * @rsta: Operate as the RSTA in the measurement. Only valid if @lmr_feedback
  *	and either @trigger_based or @non_trigger_based is set.
+ *	Also valid when @range_report is set and @request_type is
+ *	%NL80211_PMSR_FTM_REQ_TYPE_NAN.
  * @bss_color: the bss color of the responder. Optional. Set to zero to
  *	indicate the driver should set the BSS color. Only valid if
  *	@non_trigger_based or @trigger_based is set.
@@ -4820,6 +4822,10 @@ struct cfg80211_pmsr_result {
  *	provide ranging services to a peer (e.g. in RSTA role) but does
  *	not report the measurement results to userspace. Only valid when
  *	@request_type is %NL80211_PMSR_FTM_REQ_TYPE_PD.
+ * @range_report: a NAN Ranging Report is required after the FTM session.
+ *	Only valid for a NAN RSTA request.
+ * @min_delta_ftm: NAN Min Delta FTM value in units of 100 microseconds.
+ *	Zero indicates no preference.
  *
  * See also nl80211 for the respective attribute documentation.
  */
@@ -4836,6 +4842,7 @@ struct cfg80211_pmsr_ftm_request_peer {
 	   rsta:1;
 	u8 num_bursts_exp;
 	u8 burst_duration;
+	u8 min_delta_ftm;
 	u8 ftms_per_burst;
 	u8 ftmr_retries;
 	u8 bss_color;
@@ -4848,7 +4855,8 @@ struct cfg80211_pmsr_ftm_request_peer {
 	u32 num_measurements;
 	u64 ingress_distance;
 	u64 egress_distance;
-	u8 pd_suppress_range_results:1;
+	u8 pd_suppress_range_results:1,
+	   range_report:1;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index baca5b0cb8ca..849e6c19d122 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8281,12 +8281,18 @@ enum nl80211_peer_measurement_resp {
  * @NL80211_PMSR_FTM_REQ_TYPE_PD: peer-to-peer ranging as defined in the
  *	Wi-Fi Alliance specification "Proximity Ranging (PR) Implementation
  *	Consideration Draft 1.9 Rev 1"
+ * @NL80211_PMSR_FTM_REQ_TYPE_NAN: NAN ranging between two NAN devices as
+ *	defined in the "Wi-Fi Aware Specification v4.0, clause 8".
+ *	Must be issued on a %NL80211_IFTYPE_NAN interface.
+ *	ASAP mode and a single burst are implied. If
+ *	%NL80211_PMSR_FTM_REQ_ATTR_NUM_BURSTS_EXP is present, it must be zero.
  * @NUM_NL80211_PMSR_FTM_REQ_TYPE: internal
  * @NL80211_PMSR_FTM_REQ_TYPE_MAX: highest request type value
  */
 enum nl80211_peer_measurement_ftm_req_type {
 	NL80211_PMSR_FTM_REQ_TYPE_INFRA,
 	NL80211_PMSR_FTM_REQ_TYPE_PD,
+	NL80211_PMSR_FTM_REQ_TYPE_NAN,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_REQ_TYPE,
@@ -8656,6 +8662,11 @@ enum nl80211_peer_measurement_ftm_type_capa {
  *	but results are not reported to userspace, regardless of ranging role
  *	or type. Only valid when %NL80211_PMSR_PEER_ATTR_REQ_TYPE is set to
  *	%NL80211_PMSR_FTM_REQ_TYPE_PD.
+ * @NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT: Flag indicating that a NAN
+ *	Ranging Report is required after the FTM session. Only valid for a NAN
+ *	RSTA request.
+ * @NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM: NAN Min Delta FTM value in units
+ *	of 100 microseconds (u8, 0-63). A value of 0 indicates no preference.
  *
  * @NUM_NL80211_PMSR_FTM_REQ_ATTR: internal
  * @NL80211_PMSR_FTM_REQ_ATTR_MAX: highest attribute number
@@ -8686,6 +8697,8 @@ enum nl80211_peer_measurement_ftm_req {
 	NL80211_PMSR_FTM_REQ_ATTR_INGRESS,
 	NL80211_PMSR_FTM_REQ_ATTR_EGRESS,
 	NL80211_PMSR_FTM_REQ_ATTR_PD_SUPPRESS_RESULTS,
+	NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT,
+	NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_REQ_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index ab8ec24093ac..eb5ca1d1aff0 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -604,7 +604,7 @@ nl80211_ftm_responder_policy[NL80211_FTM_RESP_ATTR_MAX + 1] = {
 					     .len = U8_MAX },
 };
 
-static const struct nla_policy
+const struct nla_policy
 nl80211_pmsr_ftm_req_attr_policy[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1] = {
 	[NL80211_PMSR_FTM_REQ_ATTR_ASAP] = { .type = NLA_FLAG },
 	[NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE] =
@@ -636,6 +636,9 @@ nl80211_pmsr_ftm_req_attr_policy[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1] = {
 	[NL80211_PMSR_FTM_REQ_ATTR_INGRESS] = { .type = NLA_U64 },
 	[NL80211_PMSR_FTM_REQ_ATTR_EGRESS] = { .type = NLA_U64 },
 	[NL80211_PMSR_FTM_REQ_ATTR_PD_SUPPRESS_RESULTS] = { .type = NLA_FLAG },
+	[NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT] = { .type = NLA_FLAG },
+	[NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM] =
+		NLA_POLICY_MAX(NLA_U8, 63),
 };
 
 static const struct nla_policy
diff --git a/net/wireless/nl80211.h b/net/wireless/nl80211.h
index 1e75b38ad88d..98454b91fa9a 100644
--- a/net/wireless/nl80211.h
+++ b/net/wireless/nl80211.h
@@ -126,6 +126,9 @@ void cfg80211_free_coalesce(struct cfg80211_coalesce *coalesce);
 /* peer measurement */
 int nl80211_pmsr_start(struct sk_buff *skb, struct genl_info *info);
 
+extern const struct nla_policy
+nl80211_pmsr_ftm_req_attr_policy[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1];
+
 void nl80211_mlo_reconf_add_done(struct net_device *dev,
 				 struct cfg80211_mlo_reconf_done_data *data);
 
diff --git a/net/wireless/pmsr.c b/net/wireless/pmsr.c
index 97449bcb9a22..d1e59042f10b 100644
--- a/net/wireless/pmsr.c
+++ b/net/wireless/pmsr.c
@@ -306,11 +306,98 @@ static int pmsr_parse_ftm(struct cfg80211_registered_device *rdev,
 	return 0;
 }
 
+static int pmsr_parse_ftm_nan(struct cfg80211_registered_device *rdev,
+			      struct nlattr *ftmreq,
+			      struct cfg80211_pmsr_request_peer *out,
+			      struct genl_info *info)
+{
+	const struct cfg80211_pmsr_capabilities *capa = rdev->wiphy.pmsr_capa;
+	struct nlattr *tb[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1];
+	int err;
+
+	err = nla_parse_nested(tb, NL80211_PMSR_FTM_REQ_ATTR_MAX, ftmreq,
+			       nl80211_pmsr_ftm_req_attr_policy,
+			       info->extack);
+	if (err)
+		return err;
+
+	out->ftm.requested = true;
+
+	/* NAN ranging always uses ASAP */
+	out->ftm.asap = true;
+
+	/* NAN ranging always uses a single burst */
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_NUM_BURSTS_EXP] &&
+	    nla_get_u8(tb[NL80211_PMSR_FTM_REQ_ATTR_NUM_BURSTS_EXP]) != 0) {
+		NL_SET_ERR_MSG(info->extack,
+			       "FTM: NAN ranging requires single burst");
+		return -EINVAL;
+	}
+
+	out->ftm.rsta = !!tb[NL80211_PMSR_FTM_REQ_ATTR_RSTA];
+	out->ftm.range_report =
+		!!tb[NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT];
+	if (out->ftm.range_report && !out->ftm.rsta) {
+		NL_SET_ERR_MSG_ATTR(info->extack,
+				    tb[NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT],
+				    "FTM: range report is valid only for NAN RSTA");
+		return -EINVAL;
+	}
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE]) {
+		out->ftm.preamble =
+			nla_get_u32(tb[NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE]);
+		if (!(capa->ftm.preambles & BIT(out->ftm.preamble))) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE],
+					    "FTM: unsupported preamble for NAN ranging");
+			return -EINVAL;
+		}
+	}
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_FTMS_PER_BURST]) {
+		out->ftm.ftms_per_burst =
+			nla_get_u8(tb[NL80211_PMSR_FTM_REQ_ATTR_FTMS_PER_BURST]);
+		if (out->ftm.ftms_per_burst > 31) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_PMSR_FTM_REQ_ATTR_FTMS_PER_BURST],
+					    "FTM: NAN FTMs per burst exceeds limit of 31");
+			return -EINVAL;
+		}
+		if (capa->ftm.max_ftms_per_burst &&
+		    out->ftm.ftms_per_burst > capa->ftm.max_ftms_per_burst) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_PMSR_FTM_REQ_ATTR_FTMS_PER_BURST],
+					    "FTM: FTMs per burst exceeds device limit");
+			return -EINVAL;
+		}
+	}
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_BURST_DURATION])
+		out->ftm.burst_duration =
+			nla_get_u8(tb[NL80211_PMSR_FTM_REQ_ATTR_BURST_DURATION]);
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM])
+		out->ftm.min_delta_ftm =
+			nla_get_u8(tb[NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM]);
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_INGRESS])
+		out->ftm.ingress_distance =
+			nla_get_u64(tb[NL80211_PMSR_FTM_REQ_ATTR_INGRESS]);
+
+	if (tb[NL80211_PMSR_FTM_REQ_ATTR_EGRESS])
+		out->ftm.egress_distance =
+			nla_get_u64(tb[NL80211_PMSR_FTM_REQ_ATTR_EGRESS]);
+
+	return 0;
+}
+
 static int pmsr_parse_peer(struct cfg80211_registered_device *rdev,
 			   struct nlattr *peer,
 			   struct cfg80211_pmsr_request_peer *out,
 			   struct genl_info *info)
 {
+	struct wireless_dev *wdev = info->user_ptr[1];
 	struct nlattr *tb[NL80211_PMSR_PEER_ATTR_MAX + 1];
 	struct nlattr *req[NL80211_PMSR_REQ_ATTR_MAX + 1];
 	bool have_measurement_type = false;
@@ -344,6 +431,22 @@ static int pmsr_parse_peer(struct cfg80211_registered_device *rdev,
 				    "FTM: PD request type not supported by device");
 		return -EINVAL;
 	}
+
+	if (out->ftm.request_type == NL80211_PMSR_FTM_REQ_TYPE_NAN) {
+		if (!rdev->wiphy.pmsr_capa->ftm.type.nan_support) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_PMSR_PEER_ATTR_REQ_TYPE],
+					    "FTM: NAN ranging not supported by device");
+			return -EOPNOTSUPP;
+		}
+		if (wdev->iftype != NL80211_IFTYPE_NAN) {
+			NL_SET_ERR_MSG_ATTR(info->extack,
+					    tb[NL80211_PMSR_PEER_ATTR_REQ_TYPE],
+					    "FTM: NAN ranging requires a NAN interface");
+			return -EOPNOTSUPP;
+		}
+	}
+
 	/* reuse info->attrs */
 	memset(info->attrs, 0, sizeof(*info->attrs) * (NL80211_ATTR_MAX + 1));
 	err = nla_parse_nested_deprecated(info->attrs, NL80211_ATTR_MAX,
@@ -390,7 +493,12 @@ static int pmsr_parse_peer(struct cfg80211_registered_device *rdev,
 
 		switch (nla_type(treq)) {
 		case NL80211_PMSR_TYPE_FTM:
-			err = pmsr_parse_ftm(rdev, treq, out, info);
+			if (out->ftm.request_type ==
+			    NL80211_PMSR_FTM_REQ_TYPE_NAN)
+				err = pmsr_parse_ftm_nan(rdev, treq,
+							 out, info);
+			else
+				err = pmsr_parse_ftm(rdev, treq, out, info);
 			break;
 		default:
 			NL_SET_ERR_MSG_ATTR(info->extack, treq,
-- 
2.34.1

