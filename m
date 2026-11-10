Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285196;
	b=PhDhHhAp+P2fP2dTiFXTRzCBWtAJy1p2/Yha7ECBkwdHuSHN7NKQjR46q1YSZaGXT5jP
	 k/kNzokU48Eul3fT5jQ8PHD3YogEjr7Y6DFb9J60tXiLl6wgy4+gBKhbV15EUan1UAQft
	 yZtqaJIJFI+g1ehQZ3wfRAmCpx4WbVQoFpfW0kC3MbqJgeWUPgTmFgFy04+iZBwZmq63x
	 mK4hQy6Cd7SFxezYG3J1fsbFUp1YlUGT6+AhAL0ZtjmZ9VDUQ3V9GhPgjhjTGY/R6GQHY
	 eSpW063h/SmoYMCHtyGsdYuw3HnCAfrTWDNMOMyGtaccDhG7ZKy50oVgXtWbJjrCZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7gasy/ch564T/xC4NG/l9ya9ElEbEnyJ54u30r9UL8E=;
	b=By/BnnqVGTpZaCcaf/ONpGD/Q/gdudTIYG34jbjeGD0Z0OGi+ktufwl3kQt07cKrLGWx
	 Hbx09HgzgMa2LwMnAGS1Qf9JIdvhKqcQUzwzH7BqTkR5YkVbF/mZOjhR49Yy1VZhEzUJx
	 2HWXMS3RbOJPCbBpZ5oKx9mclrSOdY8DssnG6whapz2zCYsxgeReOW4t+sA6i8yYR8s9m
	 m50QmYX0u+mSvcMlqsbgcBT1XFxzzcH8FMF2Sg2vram+LeUK7/MSdVPSPtlB+aQnICHRo
	 fx1gOT0uDOqp5d7JAKCmScjA6FaNndo4j9xi1/bRBPZd/bSi5fXo3SKe9KvAC5pGl8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dp2f8y6T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8aClEbC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158EE606A8B6
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158EE606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dp2f8y6T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8aClEbC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6f61957677
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7gasy/ch564
	T/xC4NG/l9ya9ElEbEnyJ54u30r9UL8E=; b=Dp2f8y6TS+T/0ZtkHv7RncIVh8b
	KGiJYXP5zA6zkbQjEVlhbHs7yd44odEfNUEjCerZ5qZvK5/RJMQvEqbxdUuJ7WQt
	FKI19z29REeLNrLIuI24WDpahrr/mKwjKJRQJ46sam4Rqzd6R/A7kAh4xp4YGDuj
	P/qdl7JyDTI7bNYrqpKfsm4QOqeK/2eNzzKZ0TR1mibdgnBZX/Gb/U2VSgoF12aq
	k0fwTxptAB6aMIdqedj2ap9BHzq4rIkV2VzT0H1gYb2nwLshjduCtJb1au2xJ+So
	5uqNAiKGIdhdUacqOWJAGCdxf6vej/MKggzKIlFU4Z3EQcLw9nMjSH7JGtQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkk9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 04:33:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37390b2989bso3362489eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 20:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794285194; x=1794889994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gasy/ch564T/xC4NG/l9ya9ElEbEnyJ54u30r9UL8E=;
        b=K8aClEbCD0iVvw/aZnC2UvHqNRXpokOnEpFIvg3vg9jpDrJbySgsnuG4IY/CVC6oag
         MHhsAlEHjWjJdoPhsePMSXYrCu2aFJ/LhVahAhl6TTwtr+OY9OktlEZqwE1V+Y+uSFmn
         KvL+DE+wdbomdgAOTnAXSga2/lztIFjI6ZF/huzyCVNyJCAbfLVMtjOnl6qhhREXzqqW
         Rx9P7krA467Fc2ilZNcBRmJF4RK3+mhx73wbWT1ChJg9ShGLdhURoIPNEb+30bu2UpoA
         Z0ooAFBGQcHX6dHdwCxWyFQxIRiQVaPViB1W51OJFZB6UzHFafmtokmAl45I/FqqICVO
         TtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285194; x=1794889994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gasy/ch564T/xC4NG/l9ya9ElEbEnyJ54u30r9UL8E=;
        b=snUTOe5RTO3G2+9dHWj7BZY4gmhUymMtEgkI3FyHLvWB8zQuEz8fY3lOyR37VosQrN
         XW10vKwhnyA1I0eQTv/c+ttXGh4wmdrnMDQWtZ/lN+Oemy0A/YqIOqEyB8YDU/0C9Fcp
         oXRSC1UXewH1IDP8UwEa0YVw+++NTHAcY8CNeOA+qWCsXMgKZHGynzQ4G1dyrOY/zkcL
         Rkv/W+ePq1dPJK0C8ECIKM24tKygjfRZyvikF5/7PAB5PLykp0UYyMYeCiEfMmXjPeXi
         0pLQQZni0K5rLutI5rzrYRKGDJXNEeVRFpvlqooio3YPOoMkZHOBXU2vvRwY2lmPtdC3
         Da4A==
X-Gm-Message-State: APuU4Z/HR4cD7iju9qvvy+DrL+n6sbPBYypmTAL/Sgs4EopKR+aOp/Fq
	QAbIQsETYXbJlwYRyLr0/j5BAc+wLTg/kQw4KI4erG9T98XuyMpVw0qDdXCD75gudok0XKocbQ6
	OJM/6N++uh+HHd+EGlR2z/oads/nZZNEHQsuGTP4miXeU56O8GkrsUetDGidMSUyg9jqG+A==
X-Gm-Gg: AYBFou2tXDtC3qRg4R0YfaqXsB9j7qBPVKwdrybcBlKsOi89gAnlCUokzuKh0a29fRV
	FNOMtYQbOULKKpOt+cui5mYLyEgAdttKO+1xbctt4CotGC7G5Mr7czx0b6Xo6Rc7wH7Lx37juFQ
	jPtqKAJ2LCNICIc5tNlfDkOuRfjiu0tbIMg7mMdxt4bYO5BKx3c135A6bH/kOevsop/vr3ydleJ
	YK1LI0VfOpBZ3M8FrD6I+2FZEseA/P323ViRlKKMJlchEdm84zwUFIR3kTE22lH423Nm8V2dLz+
	lLTEHwtXLHZ5k6cmtDYpIaORjFfv/rHa6C/TrT6JH8A2IheVeYpF14J+DTECKFZhDRzwy+PdFjH
	1zGsQr5h35+LK94X6PSE9rpxSROOJFs8v0lG2IueGZQWaOHkUzaAA1a9n8iBvbZULwlUc3AAEnU
	7Gg3V/U/2MHQ==
X-Received: by 2002:a05:7300:ce03:b0:375:b560:a323 with SMTP id 5a478bee46e88-375b560a540mr92586eec.1.1794285193552;
        Mon, 09 Nov 2026 20:33:13 -0800 (PST)
X-Received: by 2002:a05:7300:ce03:b0:375:b560:a323 with SMTP id 5a478bee46e88-375b560a540mr92540eec.1.1794285192776;
        Mon, 09 Nov 2026 20:33:12 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3548618eec.17.2026.11.09.20.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:33:12 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com
Subject: [PATCH wireless-next v2 06/19] wifi: nl80211/cfg80211: add support for request-based NAN ranging
Date: Tue, 10 Nov 2026 10:02:29 +0530
Message-Id: <20261110043242.2012238-7-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX41jG43Ngws7H
 LrjR4nWjZL7uDIFs1MEodKl4fuZUPNe0k/Ma5r+7iCPY+g7JGG+sWUQWCRkFD29m9mau/2REJ9v
 ugUQL3HMcs/J+KUwpofPajuS9GaV/wA=
X-Proofpoint-GUID: IBddI5gF3z7kx0L-tYU9FfLtFGYxqg37
X-Proofpoint-ORIG-GUID: IBddI5gF3z7kx0L-tYU9FfLtFGYxqg37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNyBTYWx0ZWRfX+Lf2exZfEcIU
 S1sGQrok+htjLkDg2B8T0AXURSKl2Gg8X7RD5VKbp+nj6HUnDnLHdrhC2GqKMAVMVELXSDmWWUw
 AyIrFlHb6ZiYI/1RAAEt3HcHzvAewSL4cDOz7P0cJ2n0b6p4OkncI2eb4Kp6w08nHVrGizrOYC6
 CiTNhFnnk3n5SOTKrW5vBir1HXC7heV5x8TUdJC51+PATLhnI2WgqOJWSmqSTxBaXkwdJtRHRpT
 HXr3hgCHMOI59EWzi26tJpURNj9ZKESdD1BYtK73R04AXIOL5yJgVqj+g1rZOU/XNJoKGON15EW
 +wBtiygiqnuQsMH0+KutymjZlaAQgKx6fVP7+IW/q0vx7aVBg+pujb1UkyagosqSyTvh9L0Mljf
 cVSXExkX/kraFsoVAFAJ/lFu1wIfloL4G27fihX3DIGEylrHduUmjoultR1T2zjoS6w71gBu1U1
 Vb4tyaythnDw9aeMQ2g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af29e8a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZsUDbAycufZmAt45gsIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100017

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
index 2c5f1a7e5722..82cd89766ee4 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4729,6 +4729,8 @@ struct cfg80211_pmsr_result {
  *		 @trigger_based or @non_trigger_based is set.
  * @rsta: Operate as the RSTA in the measurement. Only valid if @lmr_feedback
  *	and either @trigger_based or @non_trigger_based is set.
+ *	Also valid when @range_report is set and @request_type is
+ *	%NL80211_PMSR_FTM_REQ_TYPE_NAN.
  * @bss_color: the bss color of the responder. Optional. Set to zero to
  *	indicate the driver should set the BSS color. Only valid if
  *	@non_trigger_based or @trigger_based is set.
@@ -4774,6 +4776,10 @@ struct cfg80211_pmsr_result {
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
@@ -4790,6 +4796,7 @@ struct cfg80211_pmsr_ftm_request_peer {
 	   rsta:1;
 	u8 num_bursts_exp;
 	u8 burst_duration;
+	u8 min_delta_ftm;
 	u8 ftms_per_burst;
 	u8 ftmr_retries;
 	u8 bss_color;
@@ -4802,7 +4809,8 @@ struct cfg80211_pmsr_ftm_request_peer {
 	u32 num_measurements;
 	u64 ingress_distance;
 	u64 egress_distance;
-	u8 pd_suppress_range_results:1;
+	u8 pd_suppress_range_results:1,
+	   range_report:1;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 17b3bbc04d8b..f4d7e259a777 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -8185,12 +8185,18 @@ enum nl80211_peer_measurement_resp {
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
@@ -8560,6 +8566,11 @@ enum nl80211_peer_measurement_ftm_type_capa {
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
@@ -8590,6 +8601,8 @@ enum nl80211_peer_measurement_ftm_req {
 	NL80211_PMSR_FTM_REQ_ATTR_INGRESS,
 	NL80211_PMSR_FTM_REQ_ATTR_EGRESS,
 	NL80211_PMSR_FTM_REQ_ATTR_PD_SUPPRESS_RESULTS,
+	NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT,
+	NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM,
 
 	/* keep last */
 	NUM_NL80211_PMSR_FTM_REQ_ATTR,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 3c9847a83311..c64b918f2748 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -585,7 +585,7 @@ nl80211_ftm_responder_policy[NL80211_FTM_RESP_ATTR_MAX + 1] = {
 					     .len = U8_MAX },
 };
 
-static const struct nla_policy
+const struct nla_policy
 nl80211_pmsr_ftm_req_attr_policy[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1] = {
 	[NL80211_PMSR_FTM_REQ_ATTR_ASAP] = { .type = NLA_FLAG },
 	[NL80211_PMSR_FTM_REQ_ATTR_PREAMBLE] =
@@ -617,6 +617,9 @@ nl80211_pmsr_ftm_req_attr_policy[NL80211_PMSR_FTM_REQ_ATTR_MAX + 1] = {
 	[NL80211_PMSR_FTM_REQ_ATTR_INGRESS] = { .type = NLA_U64 },
 	[NL80211_PMSR_FTM_REQ_ATTR_EGRESS] = { .type = NLA_U64 },
 	[NL80211_PMSR_FTM_REQ_ATTR_PD_SUPPRESS_RESULTS] = { .type = NLA_FLAG },
+	[NL80211_PMSR_FTM_REQ_ATTR_RANGE_REPORT] = { .type = NLA_FLAG },
+	[NL80211_PMSR_FTM_REQ_ATTR_MIN_DELTA_FTM] =
+		NLA_POLICY_MAX(NLA_U8, 63),
 };
 
 static const struct nla_policy
diff --git a/net/wireless/nl80211.h b/net/wireless/nl80211.h
index bdb065d14054..31a2c2eb6276 100644
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

