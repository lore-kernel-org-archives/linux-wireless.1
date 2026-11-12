Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508855;
	b=TUGJhnDmi2Sq4UoRHBWvJgLet+GSmiebOC0FEA6lXWMPMLTYq+VL3YtAgaU+2cMM27Zj
	 nppV77f/bmiQ7bJUBoF7ZkQzXjEm9+NVkZ88Azg886zYYg4g3aipnJJUc8LJTd5jL0BrK
	 Ug5T7vP1IOhOVqA+yvt4Qrn6fyTPi7nuOe8eZrlu7mVsFi0FJTL45FsApv43rxNyaqOAW
	 eSlrbfJ+3TC1RHCKR/PFrB6c1z4KoDGYEvVvdpV+Jg/UXkHR2c5JWKJ0TrBD7FKDxw2N6
	 GDzE9Kfn3Jnvg/tOGOFfWDx7h9JDuITg2JMx7i+gAy99Qe8m0EQPcyQKiSL+2ROz0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
	b=AChE/7BRh7eRAqSSg6PR6ORJEikq2bFPebOBTOlC/NnMkHo/sGZ7Io2sc0oXNMI497Gc
	 UWSy5ZhMFOepJW2jHV68Jl4k9/pfD23q8YXzzbcij2vDhqrdlIJM4g7fESoQ+r4q58LmK
	 MZ82mYNBx+2VgKeDu0i+8fYu8xS9CI7OBU8V09gv+9MGEnMXIzI8hm5jUPFzvuFfkqhUn
	 kML4IuiAc5grbaYg43/qE4CPQ8lSoEWelHSg1G7SuNFHOlADa+f9o79qpHNGb1sgsFE7F
	 tyMcxrzW2EHHbb3RtpWsw/pZvVsI7Z4R72/LCluEwn67dc3SA8NVKQYvfwVk26CCkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vcp2MgjA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7A606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 18:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vcp2MgjA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZs9b011948
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 18:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=kR7gqGW3gNo7/jGp
	m3FfjZYNdIisd5P4znahl7/XdlXgZW+srglDsTB+gm0Gseg2b6dNAsaBGbM2oGia
	4MqYVTyZLr9TcgssRiB2kDm0VSnvP7KZDtoy5ZlpUiyNHAPWsCWfaNXFxrHxZDan
	AfB46TveDYJvsVoGoTxAmBr0bFO+EQwWrVlc++hquqNyQ3nHAffIu1mVPZIe0oDP
	1mqZJN4h1Cs1M8kzefWXapkhzfC0wENHxMy0GMpRPl0rusbR+3DYgcOZYGPFadUp
	+tS3iHoHmCXzpiW0HLkDdQ5KN6rOXA8YHjBEPHER8/5xGuv2cR0FdiYfQSPSM8mN
	ydddfw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1b8thv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 18:40:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso32929c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794508853; x=1795113653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=Vcp2MgjAXYtykdfh/gA6H6lJ2fIBCKIb2exwcNiF1FtLMEXSD/qfyCBut0hOY9Jxww
         pB//hmG5Slt0LiRucxrW6TDG4v2kWa7j3lfeGdRBTAcP5AOIuXb0eXUV22fZdOIj8Tj/
         szrxJZWsyawTcZL6Gl65AK5QnJiUt7ls1JuMwqJnUP0VaRL1oPBDWpsFCVACs953Qlm7
         7CeHjRgAgR4MTGadtlGLksRzl5niMbP8mT+ba3tpzmMUkD00KEompC8i5HroT/vRqEp0
         Xnf1aa+L5Y7LokZGJh85D8zlq/gkPx+obTLVbn9T2iwhTZj1630vap8lCzQwH4IIrafl
         eI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508853; x=1795113653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=EhV6la/CDLXZXwnEpcH4SBJFOhTgw1toF6aTD0EUGptYUvNxpWqUxcVqSFV8ZuC5GP
         bLJglY6lCJOcaxL62qI5bzoi9sUVsUzm+jIQ9MtfxgycjHqWk8numrpL2mZKpZrM8ruM
         b2BgATGG1Vb38JK0a3J/E5UJwKvEFaSMVyeFD2RHtzDUgdGuEZKLC+DUskyPTdkpSYNb
         75O2wowwrpf81hCX0SkiWtaa1Gw+uBqy16GTVi74olXzEesg7Kyxku3UNAaYp6MPzzhe
         +gExcVgd8s6vGKEJCrGhsWl2VZBfZT/0Xf2VMSQqGuX4QxWsw/m7DJj57wK4N2QqZqFu
         yiRg==
X-Forwarded-Encrypted: i=1; AL+hErFKxkYMoG8krOxQ/jVnPY++LPA79DxbHiDP89rRaGJzFceQNyBvAZaFQfZrdD2Juj5ReQ1Rile2QyOuvlG5rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7iFnBzeZ/rXm/v31jjpnugZ9qbrliXGatdoxUqyoyqTOFOywN
	RBBUo1MyBIRF6oNu5HgixmCiyt9vzIJ3OAJRuMdCXJv6E1y7/3sKoAo/6mW+MXPZ2mIabpY+sTx
	jZEnZ/u5peLv3mUlEEOMrjc4GN9CPAAJ0RI3xjFdbJRRgaBsI2U6qcsf5iAhBW++05J/jMg==
X-Gm-Gg: AYBFou3cdnrm68UVaq8ZotYrG2sYABhOelS0uicPkYnFbjTZPp1dCKS4KBCQW4vaqSu
	5AKxyOuo05LkXGNoBPg/yO18iIJJAy5f9yh4hfaf/Yzgh5dgXRRkKNbPF1wBM3Gt8Hyc0WdAs1Y
	OuF6eBjOdqKTMVNKlZE4+GwGHxjpbnFlHpFl/eVIY4TeK700XKRmLBXSQ65RdiVNLEbnBbvG/qK
	8CxTnHhpO/asd0jg0Gz5Dyvln7ssnPmOCyIGQ5RcKVTlSYpEp8VMCMMeUZKyJ0Dxt6GpW6dqLGm
	zrIK+R9mVQJekkKMaF+WD2QD17d4nY31RpYc27vvJkOCifv3w+S35HFq5ibFXN9hpmbhYgIitmp
	1VZbvm+Hq6NtqkAGQO4GG8dDAOwXugLRp72K81yxq6i75z8nIxppgPqZ3sEjkAzcdfUkhhME2qe
	LkZSHGJYah1RyMIYJ6XDKjRFm9F1u6
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301355c88.9.1794508852761;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301323c88.9.1794508852098;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm1204910c88.9.2026.11.12.10.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:40:51 -0800 (PST)
Message-ID: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:40:50 -0800
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
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too
 short for the Michael MIC
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111080620.244164-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af60835 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ZjrBiyIVtDbkfVDLAEoA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: DSRG2wLLuA1UX1XkJAYUnFNHwLjhXjOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX2bePiXts1chi
 o9ipkQffQn8v+pcs5x8DGgfheUkq8gvG8BycuWpHa+geZc+/bsC4fvvOhHEaC470IiBomncyURi
 ocXAFotmskWv/At6RRGVJxBnlecOzYBRxzFNMbto9OqZ3qGfsQ6GLH18yWke3KIL1d15M/V52WW
 0HNythCNpB5d6ffTyHRnjjCq3ZzfNzpCDsXna5dUB5F4R8n4dQHYBLjiLtHJuHGd6O5qiqD/a/O
 K4ok+xJi1g5dHJgImtlyN5beh7TQvwr/4k1nCl5IkLjNqqaRz2tknU8CjKwvZJHw6AJchdg234H
 vgy8atepb3W+/E8Xhes6sNxH8T5ZCiXZnOjbxDM8shTUFahQJH5IWGj30XbUS8wAQEk/ec2CNVb
 tgsAzxuAWSyRGfOVBxeOmrHQ5g37dEwR+6X8b5RuP3YPrUoB/DEELrDOTJx1OyRMw7KoyS5KbPV
 Zf7wJ7zaMF7uIe2oVXg==
X-Proofpoint-ORIG-GUID: DSRG2wLLuA1UX1XkJAYUnFNHwLjhXjOM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX08KC2qbF71hh
 mqE2jTcMrafOihom+a0EsPqAVVZz0OFFqpAjYMKLVROUpFFKAm507ESpI/yPZ/gnTByXOdpNRPx
 k3c+9bevAfQXJKQcTiIoYTUCYKoU9xw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120074

On 11/11/2026 12:06 AM, Julius Bairaktaris wrote:
> ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
> the driver. Both compute the length of the MIC-protected data in a
> size_t without checking that the frame is long enough, so a peer that
> holds the TKIP key and sends two fragments with fewer than 16 payload
> bytes between them wraps the length, and michael_mic() reads on from the
> skb data until it faults. Each patch drops such a frame before the
> subtraction, as mac80211 does in its own MIC check.
> 
> I used Claude (Anthropic) to help write these patches.
> 
> Julius Bairaktaris (2):
>   wifi: ath12k: drop TKIP frames too short for the Michael MIC
>   wifi: ath11k: drop TKIP frames too short for the Michael MIC
> 
>  drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Is this a theoretical change or are you able to have firmware pass too short
frames to the host?

Maintainers are being overwhelmed with "fixes" that are theoretical and which
do not occur with known versions of firmware.

I (and the stable team) need to spend our time on exploitable bugs, not theory.

/jeff
