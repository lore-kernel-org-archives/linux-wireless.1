Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841170;
	b=3ftrD5gMgTU8yJr/d6GnFIiYAVYEg3D2POlagAsvBRWXwHTMiq+T10Mu8fggsqC6HRao
	 1JfqFGe1EIwnaiwzwYhpdvkP57L5/8Ri6QQq+hhhvVfwIGQfvjHNmtpR6ELvsiOSnmQWP
	 mzS4tWx1UKIBDe0iu8SC6otaWiMLrvEamCtc3RBWRDzFeAzXnFkL9Rc+eGHnaA9y10lI3
	 ZschfMFq8/ZoSbJDzd3txDQlDzbkykdUAUOHXaLT4Mg1E+gnnZxaoJmFKT6ZlGKkSLKmS
	 nuZzUGpHc5owX71oQTr8q7L6zjyMmkMkQ3EN5I+zUIK1//WWSzBZgD85b+xxSFajQew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
	b=uDjfpU5yLLVikik9Zr3dzbddN1AvpCoiDijS1tDVzVG8JpIBTZmkNl0+idutxE6tqiDg
	 gSOAZQSdn62P9sBwMNh0dWO/I908/xca0AvVPLUjpXG27koKLOjTEwHufLUg3SQsoTfgz
	 mUYdDCIS/VcKmodWHAbbPOJWNv14cdp19d7lyd414JAU4FFozKPYPZlIsmj1aDxjjlsy6
	 XK+hMvOySHTjWyuoMiEVX5J9GiUu5TEtwDx12m9YwogYypglt65gHkDdg2BZODNR6sOPC
	 HF2LJJkFlVJMhqvNG6GqRnhmlUMKGHDEUObpUNlThkeynKd45szMXtZpLnQi0isbCUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XuN8VZj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC788606A8A5
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC788606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuN8VZj/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrQ0k1934757
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=pb3Il5lDZV8XGrNM
	LLuSfhhHKQPYEpZyE2g8CuQhGwpdpOranpBfGH1z+8fL+ZQZ/4zejxMicR6cySfq
	+r6sHKXKnN7agns5niIC4xjpjONWkOfAsMiYqKMfliPwOXoRbbAV7w9At3uB/Vus
	427D+gGFDDbcofjwFNB6ce3Vd1GCzumfUG1OFkKTAflqDiel3dRJksLkMR0TVO6l
	LbElOOEr1FtIjMupAas510Jt5Plv53gAlcnLzXFyGIje1TwUxvTR8GWmH0oipLxU
	GEEiD/+VxcFy1r6aeWzPz51l6VRk42qg8b0iX9UTS/VRYY3/9FihFrDxaAowT2X7
	PudfSA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2nje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1131093e0c.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841168; x=1795445968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=XuN8VZj/tZIZ2Nx/SXm4kwnVKxoJ1G7KRhgsU+aUzVXa8+OHqowI+ha0wnrEyvA4ug
         XcjiuM5S/tVoI0wfhtDpZd5PIhjiBxUTjdlI4A9U7E5vqcXGFr41XFRD2diH3SOwGdgO
         4pmpUsIcuMEbkvwS4KECrKs2doPrQ9P7/Ih1DnnOclG/Lb6chzI21ar7aw1S0Pajr3WU
         Z5Te5et87AB3f+0v3+h6Wto05rR3vIVK0Z1UeSCZDgayA7nDSQUoiVU99RUyLJUASuAp
         qmBtDHuGCtsC0soFtB0kB8NSW3hV28o6Cbp58uQQy+bTG112fTTx1webFWg8vjZ2vUST
         JfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841168; x=1795445968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=Jr67Ap7waBx1WTnNF180LMJQNZEBSwoapMtvCl0gQIySkp77pHkrKTiq322Q+fkOP7
         q+B6sEDf/OZSifCyvHREwg+s973whrCkUKQE7jolOn5FGbGuE19Qm3oRWFf9jrYUW6PF
         l6R7q8jCx0zi2qpBnvCMHe1Q942h4Y2Pykb4Afxm00lWLWJ3FgPeIUzzqyyyIKY4a3xq
         GP1AB0lhcf3reX5P35x098VcqaRKcc1x/meOpgC4k2ytLxcE2be/3EDybC0h0Zs7hCQP
         CW5oMFypP0DKJKWI/utFtd5nXPQE7Ey6Zon89+TcMJR4qLOctmCusTisooaALb0UEIqI
         sV7Q==
X-Forwarded-Encrypted: i=1; AL+hErFx0IGmbL8C9Ru75CJAE+8vVHFmyjsWkAtaoXmvhr7+lcYuL/aADmzgTYl2+R7SbcnIEwvBKKZcJNuwotOdLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Y2/atIAoqmRQ/JujN05KQ5Lih4BSYTnhJMGiU8rVMAACv1og
	SW4svULId32r0+9peGj5cUIWfTfa+sk9cazgXb0xDw4IDO7LOBoyNq3YnJMKFJMg0n0cHAFaqAy
	1iqRT36nhKSjDjvD3NqdI2Mwee5KeiLcTn6ynHv06cTRn7gtpBqYydOX6cnu98v6ehE5jkQ==
X-Gm-Gg: AYBFou2paifhE0QdjRePRY9eWByW86xkK0ipuJfcGewj+46ajzF0D79yQRESu1J1iWh
	kxCIi5jPRBQySApy7W5XP7PVBExxrRZydFsc7ADFD3GIUm7b+OFoTZUEVpUEhTTVJYL0RqEO5JA
	ybladrRdk9oScg21f0J3GFI1gv9cys4TbFvx9mtuYfpVzyTo0s+k1rLVhJymmHBl3EnzArP6pbP
	5h9pDaGNIVilQ/Z/D1HBz9c5O5a9hsnNZZK9faSu1I9oXZOboWYisBWEBhxnMexvBKsyw+vxesV
	oGO9IKfSIplenAyQ3ytTb2Aq5724aOlMOtJWrGTlkbshwGu/ss4Vt1qoAuY66AYGRExRaiU7v8X
	NnERpbcQXBsEd1Qyk4/SooQqqI8eOsCYh91m9Y59FkATFSUuHI0Io2Nf3vz/p/SgHz+ADdJK4PN
	voGdblqGwPb1BZ5w==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834621137.37.1794841167939;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834597137.37.1794841167423;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
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
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115882.1191469.10273528779891181170.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=1115;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=nmf5XJiuMoM64HRXGwco/c9sJpA0SyP6SEfhcFZLFYg=;
 b=9OoXP1d0ITEfI+QdrBZsHqRZY/6c+avW7cSbPIi5eC3sSr8f+QRUh5U44OWYLgl3pZpz1Hx0h
 R+wI4GlIC8pCAYQa37AkKg9OACfKCpEBiEpQp1ES8HeLcaWicxZn8P8
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX0dFnWKg9jrG/
 ZElkBYmFIqjCmlFuSTLSvzAqI9htzG2SCT6NjylE5J1okhtLfA6aZZkVoDgzV8L/8gtQiIZnfAR
 e94Y1FUTeN6ctUIUvRnlee20hAVtLcM=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb1a51 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XPvbEF_LEuHnWTr2ZGEA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: AHe0puLArhjrPZBrCripwtM7EBZiKo5o
X-Proofpoint-GUID: AHe0puLArhjrPZBrCripwtM7EBZiKo5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX88BsDV8Y4YFk
 pjivkFVkD8AJ57cefuRGreO7NtUygz8jdJ81rj5q5tmLaTdyOBjYmjWCd0IpmFasa944r3G/mQM
 llhPRJeH1oxHXa9QXGQmtNnTS47chN/sp9VGKLaI1KmUjxW85hV3W0MSQZhttBzxbXfzsEDeyqU
 i/Dpi2pOuPrTlKNOpmmihBES5Myhjyy1uZSl5wbxHfnWedvLRuxLZ6lwBem90607Inw8rVQQZnb
 BKeNS+TnCnu1jqlKD002fm8ZsvvK3/AHnuVHsFeT3LN179GVeFp36SLOVSC7Xmg34X7VGVnTZ8l
 WiEEgBVQ4kGiHJC2IERkdFitard4qRtbDRqDJEGGcueDXG1GB2I1CIO3FlNSdKBdRPZVQgrqJrL
 mAGTc96NepdexiYYpaP5IkEo2XlvEyV3TcpVHOLUrn9cPvgdBanlww/85VNHMpSrjIcZklNUWUd
 3Vst9MMaSAikR2VjBig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160059

On Sat, 14 Nov 2026 06:26:14 -0800, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The index comes from an allocator, so the host assigned ids are unique
> among themselves. The base is chosen just above the 16-bit range a v2
> header can express, so an endpoint using v2 can never claim an id in the
> host range. An endpoint using v1 can claim any 32-bit id, so a collision
> is possible, but unlikely as the firmware assigned node ids are either
> smaller than this base or in the range of 0x08e5ff85. Such a collision is
> caught when the id is added to the node lookup table.
> 
> [...]

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
