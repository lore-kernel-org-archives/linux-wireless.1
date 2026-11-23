Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448336;
	b=lmsup3l30pqW6zmDfnVpZbhnaa2zQQJVfkoB/wO3QoxQ7nrG9Fi4+qYFZdCUhRxL8PGq
	 DmG4zkEhtsuRCF2IY7xQuio3AmGiir4sUX+y5bYBXlbd7HxP+KziujlCrrcwGzUPHRzts
	 t1XwhwIz7WGBBW4jAIBfqFPuzgwTCaQ9HXRnsnyN12BxdkVTYtyEYgmZ8SUs2KJXdBCVs
	 buNY4kJhQkuT6ePDrzfNiL19kzUA2VngprupZQuwPZOSoSq0+koTjLk+YcuXFa9UGHTaj
	 FqAOdpe+Dd62+QhOdRKC40uatlgsANqYDr6Py4FEhsFyR05RGcrsrbqdBd8jv845BnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
	b=3iI6M4GWlEL9qmPdIKPQ3JxTpOc3iBcqml5G0yBfNEW/Qsi4CUQ9RyElHiQNiF3lMZEB
	 9ShH09nXp12uYMP1EHmYFPI4K7cCD224CsYH3Xyz5x+bTWPDTv7NK/Rsbr0dPSE/C6zpk
	 Oku9SboJgL3sM2SrRA0vGJqIZnNezloj9EBYmAjBwIa1r4g4U0j/niUkqHnfnDkVhgGWr
	 PDPXKXbZafRC8/WldNbYUqhy011F9OR1OmfX6jJReRhFdA32d3uuq9eIm/IYgGzOFvzJz
	 5ubEl98hrOEEwvA5ncrSWtdxETI7idRZHr9Kv1mZl0Ggk5fr5DC+fzDr87byGSoCLcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="etiSRN/Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9C7606A33E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9C7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=etiSRN/Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WT3oz5rQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL31m1975139
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=; b=etiSRN/ZbBaGQPfE
	PqfRvVxzdf8I7UEJpZ95lYWONGlz2JsFbKdHzfBUlUXKEjec85yz8hBhWOcomrTF
	y37JW0So8DEWJsxGF0cipPSqiVX09gBwWww4iyjJ+90vgzEJcSFvLgq6eSVF1iYD
	z1fDYSoSGOlOr5tBQmAxpfLjSV8aI+kOxausb+34GHglWm7fTelZU2YiWDrY5LwP
	zJfR/QD2+wXLZAdu+jMzGoQNantoQJYhNTG3Y2UcmYmACqoW9LvUzCPmpwx6PVhM
	bUpTBkoJrZGe8WZ7Dxy77gHADmSVE4eflJKJxCIi6h9z8yfsTkjWyJN5JxRCoHGa
	yOm07A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7us2fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 15:38:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa1bf94cso58013e0c.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 07:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448333; x=1796053133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=WT3oz5rQ7gZbeAz44zHnkk6iVJXeK3DmzpH8P/CO9zx+F/I0hwXuL50IO7BWGxxx4W
         u46zO4eoBXlJH+t7X4co4f6Z8vNwWaYBqN8nCoiQJCqOyh5BM0DzjFvLrqdMTN9V0PS2
         HEvohFS9CFqFnEXVyVsjIjUDzrb9Fzl1I/n6ghiy7S1/TdZjXsOJVeDI3T+uG2ZrNV6Z
         dC4DCsPlvD4UsXL5jgFLwR3jW1DIjOgnK7Ylzkt+i0slmZNfZi2qGwHORpWXekimZkpM
         Zf9OlFN25XH8G2v4Lo+PE4IJANJ6CAIR3bY+YrgBkSrWR10f8HqzRM/Bz0oCd9lAg14d
         zneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448333; x=1796053133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwDysrxowIrcL6nfomWCriBbdPh4cWHD6+FT8Zt6pqY=;
        b=U4LtFX8bSDDlA6kPlCIr524rpSX2JSEFCNL6Kks1/8Jk5gRlljWFBiLtE+kgnC37pV
         /6rnJDyi//VWIRZ4PeJQROC0X3kKMle9dV0KfFrO+BjnUijYTu5F/7P3L6U4ULr+cId3
         fPYGMj+63IjAlwzwpzPnukebYZX3VSfmHqu3rt4NnNTnhpPML4M4A8OeWU9szerHaHyI
         jZ/lyQkSjK2AMZ7Ytay5+afqlcxyh6QJRMhLT16EloOe77Nyi+PIioiW/12XWi+FEFEs
         qDB8B/iuAVUB6eGIk4KiUrnDCZ9yOvg9JAiLgmUPrh8Hwt5ue1VbglVwumJz6wE2ktBE
         cDlA==
X-Forwarded-Encrypted: i=1; AL+hErEiGVyBAuKVF/jk6W9t/+rJCAqXaKg70T/0IDh/yFf5hGXy7zz7hDMPSK7IX4HfSC3dufAwkBhRECaejN6CvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z85QMBuhArDbkx39N3VAYHZvNxKziwOg45wPQFZU/TX/sGCS0sO
	wDGTBZonhu8BIA/sGUy04LUlvfgZU7j5/B4dcYZD/yy6fjSYPhlRe4DYuncp1H9w2C7KKDffsVO
	75JViBPtW1SgFnD1ErDYWE+d8qXuXsz1DMJPda10N0quI/a3nGWREBhXq+aY3zxs2sJ1oRA==
X-Gm-Gg: AZFdTZd2idXmNFztfGLM8+VzwfuC9k/uljKUv7YF2sPa+QEJXcAFSP99QFhBakdIvEx
	2PUDcmXH/YmCAE7qTfOF0H3gOIcbDa2B1WzwYIy8d+/EgZmPaZeLW7h3mEAe23X3PaufZV+Kbu6
	KAcSglPIaUgKiEqt4uYfjqHpo09gZsf7Ky+6uwqW2BgMmnZuMl2sdM+Jyc03yk8rK/lZw8/4PTL
	oo6KR5bZ/rAWWBe5rAAPuTuhJalGmn5pLfSj5/PBepvPsPi6uOay8xU6eNCnmQh3kvbHa5su7mY
	0wRzPfEtvrAYATV37qDIL+oEiWsGAMI8l4zk0ghyISN2eotIO/R8ia4L0n94uNIRYmL71R233rz
	qJgvufrxme6oX2zhBKDMIMC7xUxGc+hEXYXRwHk84g9sh9sr9lGOgUea97W6Jd5WZLQspTiI=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871885e0c.2.1795448333393;
        Mon, 23 Nov 2026 07:38:53 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6871835e0c.2.1795448332884;
        Mon, 23 Nov 2026 07:38:52 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm3621677a12.36.2026.11.23.07.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:38:51 -0800 (PST)
Message-ID: <f6eec0d4-1d37-4bdc-b09f-8bec0dcb8dec@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:38:47 +0100
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
Subject: Re: [PATCH v2 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
To: arapaille@atlr-engineering.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Luca Weiss
 <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, stable@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
 <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-1-3fed518decfb@atlr-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QaznPefjgQlkcphfeDh5fvogZmijhr7-
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b045e0e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Knk3v0qlAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wt33j95wQlzQpC1BO6QA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=L2g3GqtBoyQv0ocsUjqh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: QaznPefjgQlkcphfeDh5fvogZmijhr7-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX9ItUmoIDJHGm
 i0UvG/wHnGYVjakLpzzKUihCgaqxxb5xd6SCc6l5v59exDuYSjoDBDLwBix6F60ZJAg2C/NpTH/
 hN5aU1mBJc7uV+OCPeUrFlgCkHHOB64=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX18whi5/bjDeI
 YPttCsplgszsDT608IufhAfBV8aauX6+AhruzqmAAUjHx7re5dtUfr9HhaEaAztU3mbABqMkBPA
 6WO1T//Va4GH7kH1UNb57VmttP5cD9r2Sln5Q4oxqjQtoo09k2cBNPbgdyfROhSp/qZckz6SFhH
 LtiEUsSHh6XNlCiFVnFagTWq1rQnTUz3a9JeVM21Przbqe4NvyUM83oXYcd8bT2PvOTzz4tQaKB
 WS3TuG/iOs6bCM7EHcn2urDb3oOt5hHJNMa78nFimvxuiFrNkn6IoowMT1xXLnxISXdEKiASAnJ
 thxSwMZ0RfVUirkVfPY4sV3v/Ro/Njim5G68rhGiNip3vGNomLWc+iz8GKmq1oE5P7RNn+FeXFf
 eSZqwqmaUY2G7IMSqHMOsPoDpujaEA4Fj9Gb+SzDIQZxtH62uzVzzGCoDeHpjtmM7PkCLCH+rPJ
 QYjU+nNZ9ge4m0ub5zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230062

On 11/20/26 9:05 AM, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
> 
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, so
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs.
> 
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc node")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---

Docs say this is really a rising-edge interrupt - perhaps the driver
is wrong here?

Konrad
