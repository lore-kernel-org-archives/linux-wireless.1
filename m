Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983791;
	b=3lTcDoVRlH839E1rFxFAK9vei+Slr0En3lr+0GJ26JkvxgXeqiK134cos7VX2iDV/ahv
	 MAZp+Jl8jJngeryRcaVsdjFyaIkzyzX5RJdTqsU++O6E339isxXUtlXVXxvAiwuBvAAuF
	 FZqjkRA2ialQGMK2BsWTaExLNmKTs3LkSxI1uTRcyZFby/z+pgFfobS69me4NcI0w+CA2
	 2mW5l8Jp8OeG831D6TIIllPuO8N+jrrDHuJe3UdcvKOCS/zW5vgQimF6sk+Oc/PG7+UVr
	 jM3BS+38z1ioMc0rzHaxSJ2+ir8+s5g9bH/PBYWUDl5akqjNEPzJNiZ3Llvqh2HVgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
	b=EKGDAs2FRzG37VMGlvjrP67u5Nm5jPrM4lEiX6C+MgwP4DHocgvUvpLRKtl0VOyseyuH
	 3Ji6iu91CcrcSSSxajxOSFY6VW/pnlnhyd4LlZCtBlBJaOte/n4/mB0XsZdeoPIM+e28O
	 zVtNFlWzy+p/Lp2T0XPE8EHb1fvayiFQe9/xsOg4GRAM1cZHliqbk0vNThgPEuUpjQXyF
	 ZXmRHZ3It1EfkbkpL4D5Yy88/YmEcuFD1DsOgT5pbjAhZj0egdlKc4C00gyJ/+bihA6x7
	 jPsygHgcVkbdCVhzqpGDFHEzo1wAoxeBcMZyDJuiKC1gD1qKBh2js9gJlwweLvIQL2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIa3TdMM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0avowe8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D8606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39D8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIa3TdMM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0avowe8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ummv3371246
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RaWySxSuUQf
	RLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=; b=cIa3TdMMt0Usi+BSRUvRua+S+ks
	400rLU+tSYZWx/yyyT5nXvabdoDDmkeQrm5y/Bkm5K5Ip3AzWdjgJ8nUEkCn70My
	t5d7iGX1GnZuieEA6lTm9YhxjUX1dacgBwAEk5JP+w6OZgRfXdMHq1na10rikqIt
	0mN21ebQF63kSDHKThux63H13x5NZTTu1LZ3QhxIOX2HhCiNzPBCYjrmAXbg9sgT
	vKkP+7Dju9WWWdvBUo+OIU0uFXJAU/lvr4le4QAoR/xdHr9XkhBvHOg2wdBa/Pu0
	8skDyYCY1He24fZcHKnmAROtc9cgsk0JznNB62mRN0m/1mU/DfpLPJBLg9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sk3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 06:36:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so670179eec.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 22:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983790; x=1795588590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
        b=j0avowe8+syu3Us/LotdIpuQ/nM9bJmKY0I4R7ku13mPz3b4tzeA+rQLd/UEv/7N20
         vRtBxhWq8PCmBmClhnLQdNKMWs+jLtskLRjEhNTQqonaYKDzDzs2qOOLV3PSM1PX4biT
         8Mv5HmNpHA4nIZdx6xm/SpF3AC3+l/HTOXvU0PPhM6VzQ1hQ33fl52357Y9Rws9NKT6G
         qF8jd4x5DUyqU2vECKXJupCogbnlPPGSdFb/QCX8qrull+m4D3JoosUK9RVepBCOJpHX
         R0JuN7r57Ebi3H9LtJKBTgzT3LBa9dZN/k+eHgKIor1bw7OhX++fqM9Dd72mIgaC5cMS
         bRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983790; x=1795588590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaWySxSuUQfRLeN1FnzJ1qwrOid8Ri0z/t4XAWozYLk=;
        b=1jMsl8rkMHV58VJM5tplGp7+BSWpN+qcT5kPGTBFMFdbDUSidk1Cspvfa2hZvW/GWl
         gIBxq1v2opVj4fDYKho5/GWYio8Q+j8B+pGQ/8rT7of8+nuBYy5ov6MMhz3jYXzA8YhK
         yDI9sdTG8PKbg4oi7ipL5iHt4H9gUhHwKg4bCRTkcb7WqDrHPC4tUqWr9u5LniK3hIsn
         /pRp3C6tVQZCKILDw6ZcTBkw+bZ3iQEW+eqCA4KU+7NqYjqP1TRhDfwLhaPF2N2Jihrs
         kHjdb8kdl8ZRkstHHQAscyFmRap9/QECOmKGZr2bkcURpqNB+N8Mgm8+HMTzbBzYQI6u
         /cyw==
X-Gm-Message-State: APuU4Z/7mb//w1XRUj7+EMuH1chcm47uj+64LIpYEVzWJgvNRgiSiI6i
	PQdEkC03Uyh5hcnhU1BTLbQA2c4pRJ33j8f54MoC6Fwh+SopQKElM2fXolUSxdFx+3HAfAS0ssv
	maKBU+9XdUEZAfA8gvA7xmLNvBrx58eesQNPnTGaTVyO+u481coz4kRWrQaDrzR4wuKeS4A==
X-Gm-Gg: AZFdTZdLIJY6Moxs1MJIIw9yTW9u1w+OINCgsSWo3ShcI1yI9ES8LqPjJVUX274+VRw
	XSBW2HVGDU2Codkuo5MnqEWpZIjtoeJ48a5A5ZfaPt4O411py2CtdjkeeI8nMLYwjyyywx51nLL
	9Afqtaiv32zlU95PFHd1NsZY83uer43INUvvVOouzY7H6P8n4j/pZVPa/iatI0AOh/m0tGk/efY
	vkcvEzORSaetdhHtKMQUweUq2EbboDJqyvoMB3YfeHIqi3g26/d1TW7u/xE7SXfdoaqtkn6Y4+8
	VTTUot5bQjN+2yAfjCQJ3v/PiPxqAfdMB8Sn/FU9YlGn4LC/XP6wn5fuqdFXrvyZ/TEpg4mpLHK
	VMPPlrlF8SN5dIfeWsRNvbfSCOhDdBRUsYMaK5CAps68eBzTQy03VdzPlApDUZw0SdHDeelJCrg
	bS8xTFFi25Gg==
X-Received: by 2002:a05:7301:190a:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-382828b9396mr1326539eec.37.1794983789255;
        Tue, 17 Nov 2026 22:36:29 -0800 (PST)
X-Received: by 2002:a05:7301:190a:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-382828b9396mr1326515eec.37.1794983788532;
        Tue, 17 Nov 2026 22:36:28 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm4567268eec.11.2026.11.17.22.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:36:28 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v4 06/19] wifi: nl80211/cfg80211: add support for request-based NAN ranging
Date: Wed, 18 Nov 2026 12:05:41 +0530
Message-Id: <20261118063554.2260397-7-shivani.baranwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
References: <20261118063554.2260397-1-shivani.baranwal@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd476e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ZsUDbAycufZmAt45gsIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: NF2gk65E0UpmoSELwXky3khup7Sc74zc
X-Proofpoint-ORIG-GUID: NF2gk65E0UpmoSELwXky3khup7Sc74zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX+lyT45Lb1ADZ
 CCI1MVao6DK3UiJA29zBQ3RbQcoHJEc1QdtF/oDEiA3+29BAG1X4AYTzBDAhLTCdlTY9Jv4kvr5
 jOvVqLQXC+xbiHrCHzgjlakQ7mqYKu/6QxI70wM9L4dJl49nNJyD+qWtXLr1cFlbXMOJkqIVG6a
 B+Aa1Z4W5FpTl/wiKUWuHwWyf3SszDjZToH1dnEbCfgfh5Jolec66x9oIhTHFsMZ6rX8uosXF1L
 UTt/jA1GrrnFhEIOwWBUc51BQSGoLDB0ChBzdFI5fqUN0AhkOxl3My8+ZqLMRphTBHSiDRjHqtm
 F3hFVYIhhDTXrnE4BxE5O80QcNgFcDmYA+8xyUYuaYpLvn8b9d5nvL5QPp1kPuJ+h3uXuj9uPmk
 Y9mUxqtykKtqnJi+nAiec8bdK1U24dHz9wt4lbL9cDVanTJGsBJis04Ut77qyQcAPo1Of738tWd
 W1j2HO4w3SQE+MXHMUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNiBTYWx0ZWRfX7FAa3EEaRsH9
 7Zo672/5yFtUO+9YlWunF3sry1vxbCOsu3MBGRGcadzfQ4BMdpzoLXnrii25HW4upEaJtWH7Pk9
 TKMWALz8zRtRTPk2Opz/4NSwmjv3crc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180026

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

