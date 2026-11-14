Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673786;
	b=BsKyj2n8vOipgQlYrtmqh4COvfoFplG9phHJN5T0KcRsVIKpqAhgWhBxoty27T2+MD/6
	 U2glGVOQ5S9CtVfHuxYqQmsuw4XRN1Su8RLlmDc2O89OUttcNifxXcrxz0DdwEHMdN4Is
	 gQFYX+BWQyM/MAGqg2geSVI/IWUOqsvlwY88hIXR+eOqW/Xx7cya1iTAwzzrNCB57NM/R
	 E9imnel/nxpmFuz5XrJG5E7HvcApXB37aTl1ICq67YjZuWErOdUu9hmFRGktvhLnTA7st
	 a1k/i6nE4LTcqnSjz9drOngJZgtFA8RWzVN8IpSsnL9fvsvU1Dirbm2AwKFNThLnRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
	b=AA9FE3UjVHfJMjrUp4h7t34o7751iXYv5X1iXQNWyBkGTPVwKkIqoWZ59We1VbEvE5oA
	 3xOu1IfoB3r25p3XNxG0U0cAUzmJkROnBacdNFGxedzQwvpNGOHMRDtEZGLQcY8G0DqW0
	 /icJE8yWq+79p4VgpyX8vY6yghYeCLgkauwcc/Ghik5Zagru824fHf2veXZ045L9Kb7AG
	 SiOZHsKCTfSPWBq0qjpq7XkZ9JRS32CL0CGlzwahx2Q5jYXLUH8aekptLm7MQhLNl1Uim
	 P5AnYmxm+VZZ4uINVyvqHl4o3mxTwEGv3+sqy0rLkyDt56s+U2MfnjMIHh3HGlZce6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPw+1viQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpmVBgs7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E4606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9E4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPw+1viQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpmVBgs7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDljgj3847387
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 16:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=; b=PPw+1viQR6AQA+pi
	JW1HaAOSFgshLC2LO93ZT202AFvpFbw0+O+WOozj1IslCzC0ndhZl4DJpZiPTgcp
	pl8cyUv2E5crUfftpY3z/dVTuXXVA9sgjy53RNsxdH2Xs7V1NoZX3Io4TnOWALgF
	cn+vgHWmyXjdMzODe0zJOEVzY/K3lm/eK7N5x/acl0Qo6QfEMCBoZ3Kw+8f8Dcli
	T/0MrDo6waXv7xmrjhqquFGwQNBwSdT1+t9Z28ZXy0IL1v655wKXf2vIin9K7hGq
	iZaHUBFleYDmf9rRnzmz5BHYukyaZeleCQQlZhXLX11byoBSOPZBcbcsLHFHsrXW
	b7mP1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx18pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 16:29:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2481603eec.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794673784; x=1795278584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=EpmVBgs7nGJxg32EzU8v2RMfydWkAxMJrEtAE2e/qZRLYiNOXyEMavuXxOAWAmv3Pc
         +uF9+WL/diQ4bvpI1vL/r1kB/PcBIP+oAtrdGpoLlUogAHgNEatpvFHqSmSSEXHC/4zl
         QHcIyJWL8y1jeJhmHkMwTeMebXXAQ0O9cmaMzVXoNGByqByab0xjfaSBD2tUDq7ZyPs/
         xsxx0onbypglOCxRmqCgMk4hKgC3DXK240oKtbdU7HnlPfEQ/91pmjPUbSeUrd83k/PV
         xm6SSWfMfs7Bh1IVNL9sdUJ+AnVaLRBuUZLh12XtdwRMYlohR9hQYtm4pzUmrfQdNxbo
         yNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673784; x=1795278584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=hAWbY3hRqOYVRfhEFfWZjrmxyXnNMzk+1546BNTI2Bh1p7lffZZIF1vgrgu/YVGq1M
         FEhHTyCCurKf0Igf17X7q4LM9R/2q0y36LkYS1THfuoGZVhkue9lrFxTWWNI9udpyvJT
         4JiTNDtj75OqhAuMUlmo9ylM7kSGVXQ4YDzO/PQYkxvGjM28w5m5WcC8GNbbR8hoF/Kl
         1tNHmGAy/ZJe1BGrj1sc9QCYUptyp9zEB+50Si26CYsG+RzysqHPEkK/qIAVuKF7OvUB
         KoqSdNReAlYTfjMGa0GSPgPK61UB9wS94fhN9k0R24Vi9eEWdT8uc4dEMn9Nr8o6sBZ2
         LRUQ==
X-Forwarded-Encrypted: i=1; AL+hErGBJFZTnEFOXUFjLeHESjSHaS+0MN0qBJ+ONH1Kfa2KWAfl9oZ/+spyeX7693Se4NAW3S5WQ8QHSDJrVHRf8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sRZylOjaE/4dBIybLp/lB8kORWsZ2X/H9RElpcvzfMpb5i86m
	Fn3YWLLeq2n+M0mU2zaPrbPEDvgxICeS2vW1gh0xM7JUlA6udImO/WieSZIqP9XqaK6+lMVJ1Ao
	ZbjqlA3cZF5uu24tRtdWPOCi7V2AmWTnS1C0nRkAOGXkLfXkqcPJulHjLZT5j3NsUhVIKeQ==
X-Gm-Gg: AYBFou3R9MnWGxi/HKwn2cOxuLDStBGYxQw8ZNlF8H2y6UsyV9N3FNRBKgqbYb3TNga
	JwodfVaILIxa/nS9RaOOnNNhYhYLgr2cM7FM0qMS+voxDW7nWDfuvQWYliPVRe6eQY3/aAzt8H/
	NhVVuA3VKHGmO/7ZfDiAaPmf9H+tP9E5YKrFhUCf9yXKSdiictePKJ+CSDgritRz5h2IZu95Tu7
	PkiYPi0CCEOxshqgfC06A+CkOEuSBYqKtAU/eYI8XCgnetQpZ4nOvMigG7L1LSkvXT2byy1+aAR
	5VX9t66HII4Sg4rUthbVEGhBZiGT/CPGTogjCMIpmzSF7bSuG4DWXaqTqmqNqRkkew35sCWI05L
	Bf6nTweo2+iV5rPT5JKgX1E5XjynfCJMgACz+Y2tKhAHiavcnV3ceCqc4qHbnxCSNNJsNtVHXyN
	HAEDHAtD8171LyLFIObMbNfZSNZFt8
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250748eec.22.1794673783333;
        Sat, 14 Nov 2026 08:29:43 -0800 (PST)
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250702eec.22.1794673782537;
        Sat, 14 Nov 2026 08:29:42 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm17265093eec.16.2026.11.14.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:29:41 -0800 (PST)
Message-ID: <9e14a92b-019d-4db7-862a-ce5a414d5c28@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:29:40 -0800
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
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX0nDiaRvmfpAg
 rdwWpfdmpwsSaGqnxVO0KLWFbw/I1eIDchDKtJemVhQKhWCkZR2eucfH8NJQV3Nl4+VOn07Gi6g
 F2zaS3NRBN0XEOkwN1zysYzG4NoCPLjRprGeajyXS3uf2s3KEoQBWgZ3qhKWRYkfRG8OSbcELq5
 xNkmvU2vSBh2zKNOWdu/lXPih/QRz1tsfNgTk3aKmSOBOh9d5bPAdnnG+17bo6+82qirK3sLYNm
 twPABv10i54RBVJNdQfkNdMsAQp9ssyjQ0Aj2MuGcuVRqOoGN6XfJMyuUGTQtZfe3pfnToRvgzY
 GntFGV5nrM+Ln4XhxefSd5jfwSOdDwKkQkzSZPs9IQVDfz/lb2pm46ee+Cvgb6mQifqGsKo/wT+
 NRFoqWi1nEb4xv1cTx5MFWgztkqa9y4VrdW7FS7EPy29+CFjSdX7KM7tGxe7KtOJgfPDrWpNs8/
 ihHzNVkpta3exdIkLzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX6qeF/y4O6sEb
 9mOJFQnQ29ypuWkdj+nOKC1PFMtn3JrItaHilEnfrkDD8WzKfeIzxgEJsS4P171rYCQksRXltOq
 Wx/70V7bHgCBfFAUOGs+qxgGAUrovnU=
X-Proofpoint-ORIG-GUID: 4ieXElpPCRKvemYgp9VTn9eD_DGZ-lxf
X-Proofpoint-GUID: 4ieXElpPCRKvemYgp9VTn9eD_DGZ-lxf
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af88c78 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=DzVTQg4m434XtEhf8sYA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140065

On 10/29/2026 3:56 PM, Jeff Johnson wrote:
> 
> On Tue, 27 Oct 2026 01:56:20 +0000, Filippo Falezza wrote:
>> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
>> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> codename nairo (SM7250) never sends the event, so every read of
>> temp1_input stalls for 5 s, logs
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] wifi: ath10k: Stop unanswered temperature reads
>       commit: 2a87e367c62856b87a90f745c6b7d2eb91e0c51f
> 
> Best regards,

Based upon Nicolas' message I've reverted this.
