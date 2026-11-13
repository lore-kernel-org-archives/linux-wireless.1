Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565373;
	b=bALESU9OKbysq0lABUe14x3TGnEQ5I7DZmMNzQ6oXQ1MsOAHNV/or+p/4IVyTDFDZ1LM
	 DBl97HPw3xPjTFaSxcCV8rBwzeZYEbdPVeECcjFV60tsLfViEOGGIXJ8+y1zkk1i0ASF+
	 6AWz55F2vxVY53oVqFoYe5rsh6VJy0AvCcM9sEQxIa0B+jzGpsdzKstJhAeKxDcO5Uq7V
	 JQAuyhk8QK8W7kkGt4K8c2Fo2pjusImTF+8F22Hj5D73DDgGFeYPOW+6Pdv6xXQ4kLs+Q
	 +snJAbC7GGKE5Hq0a3wmUOvvaBhYs47ryNYpXypQy2BW8U2azg5Vz7LYld6M4QVZfCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565373;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
	b=if/VptfK8Z1Z49f/n+i33Utpl59EahdotzgP9VlcF60UK6Bf8/kwMH6GHRA+5UX8Tfg2
	 3x8IkXd3VbTOdJhdhb/3KRBv4SIXj2BkTMOz2Eqd4yMVlQoVY+O2PSU2byvDrAKYwcVZx
	 jM1oItdmOS4dVXTYSN/W9wmgi6gMoVvCwsk6u6F6pRmVAhDqdfBFnqpUuBkipHIBcQjO2
	 ak/UM/vYx3lcNXwMI6ILn5b21qARwBuVKYkRgqnDquayiZ4URGIFKqoTHOJ61T9VUGBHT
	 rLUi/kHKpwYlFAzU9090pTzP5DUzacURLqrvZWFU3t0WsJI9OtoDn0LxGVGpagTBcaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="M3yXL/I6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyWCMdqH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BD606A882
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584BD606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3yXL/I6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyWCMdqH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA4xkw1161438
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1DRtXtdINJr
	qED37R4vJVlSrtHY+/7gPks8tcJkqPI4=; b=M3yXL/I6MMddpG8mQ3ftk92vZNI
	GzK/v8M45n0unVxLDio5rvFZInVqTK/W/LeTBg9Ef4gI9CgazM4/XmhyFb9YjQSU
	OZ+kN2IoEpdJlgiMzJb3r/64SXY3yHiJncJ4x518UKg3ZwcgDqt5nnkqvWp7PHxm
	7R2hFGYgGq7RTm3fgUiMoGSIPU+ijzsap5Qtv/i4yBo5DNwsGabkA/APpEakbvVD
	77c694EPvDLMCCpiBh/iR8Ny0tW9e8xaDpx8zfUjISnxnMTPdgR8+WQi1mlXjb+T
	X7DQwHWoTYZ87e9/D5xQxxcqYcdpS5cFE+xdRM91bobpQKHlCn9aI4CAG/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g201uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 10:22:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1032476eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 02:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565372; x=1795170172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
        b=eyWCMdqHgAOpT0rT3ZXmpzlWao2D5az31e/IlJvY9Gt14NItc8NGqFfayBpKr7Y+Bn
         NWp8iwKID0IPA1UNlaDLPcfs3DkaMaD7kKUvMo/EaPXuCjkE8cjaWRbNxUGPMcZBFhDY
         61JJOqKrtymzIdQRQtLvpux33SBcduoJSGdyA315PpXvAJhJ3FEhrO/djgM44OIsbB4X
         sdcCTpJGnDXA0pSq6vpwHyoSVNwxdhLzlaCXdOXo0w/YP1XeZwKr5t4FLNC/vIr7WIsl
         cdoZAtxowzEScEtvs/ITd45azPHUrH2OyXp2KxpXKl3+5HSLmnql17bsmnUeLpIpCXLf
         BPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565372; x=1795170172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DRtXtdINJrqED37R4vJVlSrtHY+/7gPks8tcJkqPI4=;
        b=FDUDnOvSNslJ4C7KvQ/Vnbqh4tf++Y7ghwiPcAu2NVFdi1GupBLF3xKqOaCsMlMEX6
         M6PjSY/Xf1/CiesvsCRZgedbQwQKgTWCMifJsV2RQovsRVuqwNteTYIm0mSW645ljt/K
         HTGVxho/iJLh9vEPQkv+vm8T8Fpnpxxbj75VX+rNQSulGkmBX2ssbkTITFKsA6heY/rj
         wG7/cFfz88rnzWSbdVCDm0dTXzqbMLKKSouHeBfHEBNry/IsWoI+WSnFL4XtjaIrhyqc
         BuMogQjHyIDbsbTWgzo4W2hq3UuFplyOFEGN9GLho15znGxb0M07aaDKQttpuyfO+NJS
         6LLg==
X-Gm-Message-State: APuU4Z9Tcv+Ac2fVfbtLxw8EWiEnvqb10mZGFoFf9xqqLTQgT7qdZPes
	KNM4+XU5L1cyv/+VK1cj+X6mvfharYZTF7qtHL8S1KyCzqfmVp5AG7lEUCiQ+Mxk6uTWZb15acr
	mt3U/0my0sTTGDG/pNQnVTSpYb+35MIdRpsnL30DL6DEc7MkOUNrNuoeJFdSNkyqa6f8ayQ==
X-Gm-Gg: AYBFou3q2qg8obpqweJSLHiKfLBz3/7OTgmwbpO6iI3blhT0KV3a0My/aPnnpIW5lZp
	c94xxkZqVbvgj/cU3rIXIjLOoActTj+OwOyx3x1hVcnCaJPolME8F5iyPFyzSFxqPJNi9h0YcXq
	KL73wDUTTf5luchC+LS2Z8zPymZKLxBRN8BJzIyUH25aaolBrKKQuTebXzus60iWKUyU+DuZAn7
	gDDdHblk/jXYb6zyF9DDnY+2S/+lx4uGmIpxDCL4BDl3OzRT5zmbiiLlx1Knr7++0KiQTPJsmgD
	NuhA317HJWlZtlWqDglNiF/TM6HtV+xiHRORzmpNwk171wVbwU87fuNP+owTeXmYi4zulTOLKNz
	eyGu116s28A1B7MjfppXmlAtFVJrpyqUqdEzb3J+AYpWJ2iOfss9DTAVw5wYvOlsjfh664E7nrB
	ISjs896t+9+9U=
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr965875eec.14.1794565371821;
        Fri, 13 Nov 2026 02:22:51 -0800 (PST)
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr965861eec.14.1794565371361;
        Fri, 13 Nov 2026 02:22:51 -0800 (PST)
Received: from hu-shivbara-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm9554270eec.18.2026.11.13.02.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:22:51 -0800 (PST)
From: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, kavita.kavita@oss.qualcomm.com,
        vamsin@qti.qualcomm.com, vganneva@qti.qualcomm.com
Subject: [PATCH wireless-next v3 01/19] wifi: nl80211: reject NAN function add/delete when Discovery Engine is in userspace
Date: Fri, 13 Nov 2026 15:52:10 +0530
Message-Id: <20261113102228.1917973-2-shivani.baranwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX5jbc9UB4G87t
 zUi57JE0elXWY7r5Ce676nfFCmcvjp1sDmQ9XZPFWxatCgnmgArAj4lPjnQQ+7/Ox9GycwxUmCx
 eokeR6yAO/pH7ktPDuw8HlDWkfwuwtPaU1NfwzbHceJ8OUvPS/Ftl9MuPQxa1ifRY0wVawMqvsj
 biKx9L5Ik5j1EBgXHuYkV1XgN5ZbdrJc1ry+7v+mcPCr+a5QVjm5dxisfsszqGBkr0YeQdLaH+N
 Vfjz+rcGEWVEwB7250O0M3VNhdJtYr5eGTuLNI84N+0SAywnmm8mZ3NuT6WCRfAiv6icoBFmFUP
 XXtmjE/er98d7HKThLK+OBUXsff2bwUcsCDs0640Vgw+jzjwBM9cJFgUJrfQOR0ZXgWJbx9ACvd
 psEc4lKweU+WIWZUkoHDmUy/CtOs4E8q0jQuiZmtugymIrFK2X9FPZn+xCJC/+3JrtkFNNu7bCT
 QJSOOeAUSTdMlwIHJVA==
X-Proofpoint-ORIG-GUID: c1xLqtLvHdsg0hq2o-NM-LiS8gDJzua9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXx1Gls87gEhkp
 YnfBbrg5DvH8ypFuLlICYpqIaMZJJPwYQ3qwqwY5DXYHhA/mrgl4uLbrSPDyN/v0Hmc+EM8LGyT
 ZLw5QrBngC9nXg7SdfuGKVnO5E4Ki4A=
X-Proofpoint-GUID: c1xLqtLvHdsg0hq2o-NM-LiS8gDJzua9
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6e4fc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LdyAoAVN-_wWoD_69XAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

If the driver advertises WIPHY_NAN_FLAGS_USERSPACE_DE, the NAN Discovery
Engine is not offloaded to the driver. Reject the request to add/delete a
NAN function in cfg80211.

Signed-off-by: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>
---
 net/wireless/nl80211.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5189366809db..5df058b835db 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -17419,6 +17419,12 @@ static int nl80211_nan_add_func(struct sk_buff *skb,
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
+	if (wdev->wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN Discovery Engine is in userspace");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_NAN_FUNC])
 		return -EINVAL;
 
@@ -17652,6 +17658,12 @@ static int nl80211_nan_del_func(struct sk_buff *skb,
 	if (!wdev_running(wdev))
 		return -ENOTCONN;
 
+	if (wdev->wiphy->nan_capa.flags & WIPHY_NAN_FLAGS_USERSPACE_DE) {
+		NL_SET_ERR_MSG(info->extack,
+			       "NAN Discovery Engine is in userspace");
+		return -EOPNOTSUPP;
+	}
+
 	if (!info->attrs[NL80211_ATTR_COOKIE])
 		return -EINVAL;
 
-- 
2.34.1

