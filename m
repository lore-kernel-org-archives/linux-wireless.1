Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486865;
	b=T9XZCrH1zoQ8MxspjIDtAWhxIzgGp2aG1PIxthfrV6OMoKm5ewwlT8pSzGA6zHLWEEz/
	 M/zVSk40uu3FSMG7d6aTrGc6ng4HVJf+jKQL9cTcu58yW/c/xYc7DRN/f4bMdQjV0P0JN
	 XavnblSE36sNdt81KU4IZDnQVwJn0oxK1NdiIXDDFubc2GU1UibLTtXWCNqhWAs/5T7gz
	 T9+6BmHuAH/qTVL0se+2n+zf3vXyx7E35OYiDLhFS4LENdDg9SzQWo/u19YrFO94kuUvT
	 Hnr/YwtrmFTQClLCJGDZ9zudriOQApfa0qTxCw53luvjlpoXYop36ZeZV+kKgjCEtCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
	b=T3Pi7xNKffwJZJmxFJngOpXaBEah/LN7SMBvqzy1M/hrbXlxoHlojSsL3hfthUzGTF+Y
	 yR8eAfqXV/fLEm2GlmzSCTkTEJz9jzNADwajkKKuNpue75UsYBfd1MFCG3AUsrLuJmGQi
	 3yKlqrOtVfU2fBjd1xJ+rlFWZhlUmlO29BUe0zHB4tGE1+64bopKaSKvFu9CRMR3aCBF/
	 vacFL76nNv1aBFFz4SuATg87x1eQJzkcJINOmGNGDTEicEkJF522FTW/Vu5bDgXfe4Un0
	 KisVHA1nQ6zYxuUDFip9HBwQoQ0nr1iOMbGhK1w76iZo2vv77J5IVzmYMOhEWlp/Owg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqOzEJEw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHGFiNH7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA42606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqOzEJEw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHGFiNH7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuHk43514055
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=; b=ZqOzEJEwo6kapjqi
	AVW89+o23xhNlELq9poapFtqYDVYcD2CCnNPFxWBu+EeP9VpG1E52NMbifwnv9bC
	38kJOzoyn8GZ/C67jEpusKMmNHRel2QddAo1mWf4LHTmgYRdXC3Lrs6+b1IZW5nj
	rT02N1Ksq3EWle/S0IoBQVmU2zuXW8kmgigFBfoKHV74m8+mgpYlQNqnBrmZ40lR
	cwS8sDr68oispp6k1FctqnV8JWFCV89RkgDGaLYTPw3F8NjDnGtyk2N4m9yiQBIu
	r9ehwimOfVViUSPQJci6mgxEHVy+GfL9fXMABPC4bYNOD1A/T3GzTDu1jwuQRo87
	6E2dYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr99gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so3292898a12.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795486864; x=1796091664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=eHGFiNH7W4sHmvcHs/5hI0D3Bs7m3sKmixeAkRgn2rv5fkZ8dQMLObqgNSdAXlnrfH
         7Dnq3iJrrdfsC+FnP0PfUNPNlMRKPZn2y++mmKk2aX8Xy4bvOTafZeO6xKpA84OWT+fl
         UBEdNi0CBvsVJKXrvFOqyu2LPr7a1ZIkmZdIZbTHPjTT5HneCCwukeVYXwacRGzFxJy0
         ta+VV+8enNOFKMHzjtmh0Zl6jb54KyQ4A+1yjYNP9OgutzWrts77OdV+aaT1DNgJyW0v
         nCc4vYRkYogXX/LEPVCn/ZeDuBwoxB6UFjKg/7K9YkT/UCuyf7APkjDoMIyqzmj8LkKl
         ZweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486864; x=1796091664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=g0lqSNnSPv5Oje1rszPoucMyPqvqBZWZ+NcSDnCOA+lpa1e0E7aNJkeId8qeotdkFq
         IeHXLqDP7ZfUYxOzpzfbbaizcIqqgHlUpk/ieOvNDnsZaeEDbLnzCAxJd0NPHo7pb2PK
         /nbV4nLxtp7eKnyx16HrSRW1HV66iZAXf6KG94b2vlHBy+EbHJtCqbakBLLXJAFNFVi4
         bRjJauWpSlp+rCSeSe6uPmoRYVK2dIsvEwVx+WFPOgbaI5moveSgDSuflFau6Cc5o61I
         +3U9H8o+Fw6iAg28Et4rO0wmt6rwslgprkMlrQxhc0hvSg6RGS24/UOv/XyHG95lpK98
         1NvA==
X-Forwarded-Encrypted: i=1; AL+hErFnmU6TjhU/gkR5ZY6IUrjp7XoifPek0V577dG0lUIoFFclcuxeZT/ZmsLMi3gFiFWysaiFhFpo6FCgxcYv+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VSLC1uU4VQIz1WRiim4antBJi49cOK/0cQ4ARyqsqHhrQJRrF
	hteMmf/O+E0hA/1Jn4OiAwtJPP9cxlu4dhV92mHHq4QoGhnxUEtR2WmfYHWuXWX/HMpB8/9E9le
	XLDycTt6tHS0BzMnSy/35nRSvGuXJXHZtrACEY+ODTwtmkDeqRXU+VLRHVWCtSF/rA9YBkR/5C9
	oVZItD
X-Gm-Gg: AZFdTZfPrAraKTsjjauNks/dtWB7UavU4gT+kx3VccYIByocRdTbtLSUjUXmoyP1YtV
	KjNMkAPQxY9oqe+2vJ0aW8/Z+nabpwOHJE4ac0fI3IW6ayQ7nLSpyJ97a3ylAA5x4gHdmAB3U5Z
	Um7BS+UfuP5OIkGNQJxHz77gZD2FZSI+X5y7vZsKBM2brC6egV1ajBGP3rpflfXur3OlV0zwZ8h
	RpCP5plUNoNrKsomY7T1Ld2JpsX4m++dAT9vdGvBdk3FfAiwTbpS8+0eLwb31IPdzLOLeMgpc5O
	j8L1GGnJ8m6fT6XS8sHJO6kZulFQfy4KcrDVlJ4GzKtwYSGeRMfQYOJrdohPw5quJBMpBhwb2OB
	eCJHf31qPvLcr65aUUrYCgqboc6o84aoOCDq50QmiZfplQOPWxL8kLK/8uxxpkW9PZWHcCE9XJc
	xtEJThJCeGzvr89I8GnCjljrUPwyuBWxFzX0f6DGhPN23ZSNc=
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867048637.9.1795486863641;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867032637.9.1795486863257;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm6298892b3a.13.2026.11.23.18.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 18:21:02 -0800 (PST)
Message-ID: <a9863854-187c-43f1-b7c8-580938dc7253@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:20:59 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfXy6fdIntf+OBC
 e7gU+4qmjlcKqQdN4awj0t0gEE1XdxBSja4J3fGv+rCgz8MwmgYwCzd3FXw7hbrfpgnHBNHrSxC
 UMd9dpdD4981GFEfbSdxp9G6tqscWRs=
X-Proofpoint-ORIG-GUID: XvQAzflGIg3HSeN7_ljLiE1t2DpzvTgK
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04f490 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=4O2SGWbk0Q8A1cZKks4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfX12YNFAkcO3zr
 vbI9c8lG0Rx/UUsa5wsB9jxwgQmmIwz3nMtQEe4F8CFD6pd/p0qQ+XqInA2ZdCqo2SeZu6ti6a7
 7Y2xwRigxiEa31O4+oTu4rEiXvuyVAFiI47lZ5H162qqitftYi6bnGKMnw0dQDSlrcufout3Yr7
 l0xNUiHQJxCAHA55jKdHTNfVNukXcVlVfIi6WQWL8nLMj76Cs1CpWwRiiF6y6SalrcbVZdai9UC
 jflM4KhzAgCPP/3OqGldaZPo8/ClKhkKWWz0o7582bzVPEcWRoayTROcmoRYVj4j1mSsPj2Y4yY
 dRPGDsVnJDLiF4NbOKhamVBJWYHqeJr9LIxdvfI496TLuA1KERigyh6Mzg91RJq3WTUXLSTbCPR
 ulkaFU4hjD+POo9+oOl/hJmqnwRT8RMV3ikjWogesdqL5Jwkv4k3mcK9o6894MG03IRFW1AG0Ny
 q6rGNEneiIFMRJl/+Cw==
X-Proofpoint-GUID: XvQAzflGIg3HSeN7_ljLiE1t2DpzvTgK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240009



On 11/16/2026 10:10 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

