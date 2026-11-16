Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806927;
	b=mHPSRTNNH0sKYcAZXIMTGsMUO/vEK77gE4agvrDzI5sbDpU0MrxWvk9hQlbypQZqfWrP
	 2Auy7DHS7Q9ixCH/8DgujD+ILUB5/mDT9oia8bmoRfR4oriy4Wh2Diy50y0eaZ25Zg0so
	 LWyjBC+rLSv0u7vmjSKTWqAxYLUhrLp9xkLic6ARIFO4MpFbI+9iS07NnQyWIl+OOWQAh
	 FzyYv7rqS+BNlxqT0Lw0SsMI/9yyAfz1yG5MtJKK/2BZsnGXdULwsvbCyiaFFk33V2FIT
	 yKnop2Y2x03niCzSdBX7nFlX4pfGgLk383i/KWJDrqedEyBTdFNu2B49gvGk3gbuMig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=;
	b=m4Z6WVJsj2NiE6smtCnkNtidZrksehj9tqNYJq5GsnvJRRIJkxurSwg1x8sKhbootqKX
	 pMt2HuSezKEvDNYNhdzk2ZPdjVb2U2uPd7H+8izT7IxCyjTW119qtWHwbgUpnf6/S++LM
	 qIZExyEfsbACjn71/o1Yabe7BSUkMjwEsmiMFGBKjBm63Cpy8US7tcJ88zXs50gwBFrVP
	 k52md/RMtgVH4J62vIxM/e0z2pU4/0PFTH71UZm9Isu0gpjAI/Mq42T6cQuv/SjcHroeb
	 g6bYaQsWLXh4ac496HubmZUD+Ow5hH7GvdpOls2VW+spgeYaIKEQ83lAyySe/JBhSpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSLU8rb4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VS9GHD/q";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC628606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC628606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSLU8rb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VS9GHD/q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5MjXn2233621
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=; b=BSLU8rb40a4A7lS5
	RQf8+O5Y/kwCmbIeyiHLZt+C//WvYALuwK9dtsPvRjWn96hBA68JPTFVTNDxngif
	y/8PAb776tWK4CCfvf2uGJa8YhtmS+jcnPe0LIWP7IIloIpxoNTk0QZqRUhNuXlV
	qpRR7NVST18jVNC5a5ygwJmKYNmfYKGWgwEQYV982H948rQrO7LzOh/10vn3p0vS
	YPX3mMM+EKbUmuDwkm7RFlb/Pku92/pxmhN8jmJjdeKHPWJs16dmPzHJ38lRS22z
	a0aX22PNUv/Dcxa94PLMYN4JYYW7jKzO5IJt1yVxvTqd+dmccojD8nIcA4Qvs6v1
	2VTqdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vt37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 05:28:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1547602a91.2
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806924; x=1795411724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=;
        b=VS9GHD/qET0tbMVz77PhJndhssGtv4Ij4d2a2C39z9FYvYT2c8VZ7/1EeorHz8E7Wd
         jahZZYu9wV6RjqGLm9HxRnbvag3eRWTyKR4Yn9UoiMpPZLLhj0iVe72HdNHQ3vJztgO0
         lgIaeR5MdGXkstXKy9OBEPxPc5VK9pCUJ50P4GGvbhIGx43TRSKa2Du9luXe7+V51oef
         6cOG/EoSf4bNZDCul50rJJC9cNVNmRaa/g8V0fWowHP2qu1h5fWG2B0oK1HraAmd2DNP
         3vA1P3P+pUCyLZgDnPOXLVKSJw5lO57u+mZBYsgZbT1UpESJdcJlQWjs85YkNx4ktcYd
         HQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806924; x=1795411724;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=;
        b=VHpwSLuesVmRNuWGSn3HHJFGEi0dTe7/Mkd8Ov8hUm4lBYiC8N/wZdui7GMIZ3WJ1m
         vj0f0pc1DSl1WSovV0RtU3tOj8sIFfmqXlqhz2fPd+0g5Ukn1HNPtaOmueZJDawQ1cn1
         3AJWwNbh9zIIfdOaJOsScoQeAVRZ8srIf/bjOz0T2rYBFwHhhsLsyFewjJWccxVjnMRd
         TATmKbnXSgUiYYBMlzjnqCTJ2VTFxT/CHwsPsvyFrVp1rZgdbaazCJkAGz37BYPf0dde
         I7lKU7TfNCTp30hI9ow9/8vxPPcQEhkE6Q47aMwX5MdBmx2rRUaQdGbLKmqjnujLe1Ib
         kskg==
X-Gm-Message-State: APuU4Z9Cje1/zQcDLlKOtfjsplhMGTzC6iiBsIbsF1ken2TjZvgtdjwU
	UIe2znlrdMgFCvIpf5nGR8mObAzjdyX9+nqu/KitH+ycCk+x/dohwsmZi36Izx2GQxaurNF6Ji+
	3F82GJ2rO+dFQPYWl+tRvMC/t1trw2zFHZQoEo2qqXmp6gCh6HINyBudjG/A3hQ6TiMBOHg==
X-Gm-Gg: AYBFou0CPGEytItCWJkLq2KLMfhHl8RM8KJo8SqbAaGcJJnJTOgrShfvIm+4UhGXuCK
	CooL3y4q37m0t8Vnb5JU/uxtWsqu43jXI7RSAsY09ta4lgz1jRlW4WFzgaG7hwVddIjDqC6kLuz
	Ogx4iWO8i9Aty9906Erc3FBU5sa3NN2EYNREsTLP5zlVU4pmD6iOQDj71QKvnGfe5kd83vOeLAZ
	ADPPzzv8RXZF3SUFZasSYVf86uKvgX0mzsgjEDHMoKMyvgdsse04uoQUUamhcFALl829WrRnOmX
	wj4gRHRTQXQB1GnLXNvgxn/+VP1t6vDj3gGl+o1hT5QmVO2fO7fJHlCZ32/wtALPXdQsJS9pivV
	X5XE1g49EDYo42M2mea/vwi/hBPov3fLCsWVMcKNEucPLcIWVO0YflipcUJTof1oFe3GuZNjfDf
	45isBxLuRnK99aarj5kie+kvJDYQFaIu5SZ/3iq2gbGEK7
X-Received: by 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr10218435a91.43.1794806924451;
        Sun, 15 Nov 2026 21:28:44 -0800 (PST)
X-Received: by 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr10218423a91.43.1794806923995;
        Sun, 15 Nov 2026 21:28:43 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm16673592a91.11.2026.11.15.21.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:28:43 -0800 (PST)
Message-ID: <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:28:40 +0800
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
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Walt Holman <waltholman09@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
 <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa948d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gk6_8DYrtsVGEpf7B5QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX8E1o8rn0WbN2
 uTJ1iEGdpCAnv8TOBWlbmy09vo0Sw/qjsq2GIFXjt6QqZtb5458Dwak2vK5hltkDsgBFfRzm9jC
 b09l7EO8QAecTKdxVntkXvq6z7lgeSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX3YHbQ7wFQGY2
 YqU2oi7xa23Axi69rE4G7gShKCmjyCzyJ6Xef498sJEYk4f9brjGRXVsQbJNBBAmFQB+folk64/
 JJGAmWC0OJxdowkZOZBDN+nEPwc1h2HaAdjbNTghh6iYbbqOTjmZblNJk9Z0qJDakSCN+y80ktV
 WUMID1lZVSfA5z9cuwH0Qr2wrbFhOcRx4l3BtRYxQexM6oczSyPnEy52PlQ3zwWr5J6pgCfQCwC
 Sd1xosIMHXJd6TMiYPlnXwgEJDoMn2rcm9T+LaCconm6IOnHiJ+EFsxAau91V9XWJaD/PebeWMd
 ockyF2kG8B4U41Z6N0UFkmd365y+27IBrYIBEd1ivbzRMevzfsWhSAgip3kIej1B9pLKK/uVRY7
 dP5UKEGv6I0m3YeMgnO14soyZHxbUBBSxdX4kVZiJjfnDRK+jrsOIoqQYbiyRes8CwZTAizT9vs
 JgHwCIxStXapnQ8nHzA==
X-Proofpoint-ORIG-GUID: 0ZzXmRtlNJ-Fq33-V_Qv0nsZ8gnbug8c
X-Proofpoint-GUID: 0ZzXmRtlNJ-Fq33-V_Qv0nsZ8gnbug8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160021



On 11/15/2026 3:35 AM, Walt Holman wrote:
> On 11/3/26 09:26, Jeff Johnson wrote:
>> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>>
>>> Hmm, forget to reset revision number ...
>>>
>>> Jeff, let me know if I need to resend it with number fixed.
>>
>> No, this is fine. Waiting for a R-B from the infrastructure team.
>>
>> /jeff
> 
> Has there been any progress on this getting merged? I need the patches to connect to my
> wifi on anything other than the 2.4Ghz band with 7.4-rc2.

the v5 version has got merged in ath.git already:

https://lore.kernel.org/ath12k/20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com/

