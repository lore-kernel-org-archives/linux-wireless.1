Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442377;
	b=XqZPjlcrmOYze5LbawF2gV88k8N0OSCvUjYT7UBeYpQarHqnW6XJ7KjDmjOQbnZNAVJa
	 60V3ZxuhIPfelyDG4qHuwCdhPWjR2l9ErmYvlxagqYcIIOJbyYZtqAd474ZUcCqF43sh6
	 8cSpYZVtgcgCn9sW43RlQqunO9FSStF60NBgjODFUCm5iDxSstmuylgVHLcb9haLMgOjy
	 2IHxvy7E3Nb2bhdh9GZhhl6eA/GwVNvZ/MmTe544jBLnFB4qBzpn4NZizC3kXKtWviehH
	 Jt3F/zB1c047tUD0EgYuFc7cTI0CXAjBjDvm/blxZJfaMGi0aWPhI6ha90ri2UAPj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=;
	b=G+HdSWBJ0a4CPrhTEOkIdzrXvl7NpbFeNvk8oaZISRNmYZSGl14Nw+cBbtCp2x7tloyf
	 NP5u/7Ss7nd828YMhf9lPJATVSrcjBaN8VfRO6j/BRq1TTd+2pXtENq9qRcFDaKTmZnaJ
	 73PvBIXuHuMmP4h07C8mAZ/7EFB4fEEyHKmXhw326Qw3DRvML+IhOmH/v8R9j7RKK+cP7
	 S4RA/B8Kd14AEVwVXbZO/zCNBWUywNYigQF/mn4YSUdqDIGcP/Qv0MafrMTDFw53c6j01
	 Gg4sUAhB15uE2mZjWRTuunNWkNXT9n75mDYsYmHn++J1YG8p4JLToRb2+ccR3+ooIeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcvPpPlO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKFjhdWJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08494606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08494606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcvPpPlO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKFjhdWJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaSon2651495
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=; b=UcvPpPlO9M/ol0+T
	kncthZ3En4oLcc2+0p0AYm6rI81Q2JHmoRB+xAtAaDzmf89euB3TeNGu7/fftvex
	FnHZJPpl5O8wrAMJsbjdeWtSQUfyWvfFlNjAEy6kRd684Pq8zOg1i64vCSrWLd8k
	uApbF3dwbShM7d1knLGTMJecQik7JUqPzcqbs/sDP+49IUWpDz3k9hhJrfZxzVrK
	qitkdz74unzR5GSsceckRNV/jKEnqEeYEgi5UaVBgbw12PDMmwu05cFef/jY9txI
	D4jR0wXX6kpGnbG66AzFzkGJa0gnB/mGlNwzn5KiusWSCPytHm5OB82kZM4VsoyT
	2fsMvA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pur9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 00:12:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so7407749eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794442375; x=1795047175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=;
        b=eKFjhdWJeveXfGiyaHvod6QKG7q/Pfh0ABogHq4u+tV0IMpYtAoCFWwOe1yETLCpAW
         F7pBaQgScG11aDxj1YBNOvx9J89d8ddRa7m/PlBvrEliT/gvqcKNeBxM0WHCQIjvBndM
         fVe4LAMVOathdUusEwAF8zc5NuAhCmBJDP7AFPeEITA+4Be6BLGUJYKFz7qi+yzHsyuT
         8lAOlG5XHc+hSLp08/jbZbV0s+rczyMaggCcDoUMo/wBjBTZfH4zhCaYG2KHpHsQt8wb
         2BxQOEkNfgS7na0ScEGqd4t+mx/fGIt80q1YvMDu6ucSXkp6ama9yoPD0hc8TFJBdloB
         EJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442375; x=1795047175;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50cUKcBwzzIYqHfbpzEyJG3oIfn7RAkW9U+HNZUhwdM=;
        b=PCqCydpUayVmS2R3NbG2g8IEEJvr2IPFhIjyVNH0li0dQUfS6pvGsq/cGwu3CGYlYt
         QtNmd6t8z4A7TyZbE0lPybOXHBjvyJpNSOdaLFENfNxfTeUNg8P6I48UL7QQ5qrqSgbn
         3jGFHQDDuz++bb/Iy8PXP7+VAc1r7sVri+bw+HQqaYEaxwTYCzbvmCq5Z9sObDpQWLdr
         3924j6LE102tJFfgfHl0oD3pgtmzszBo+eD8Drs4GJ9Nn9VKTv+nu7BqGdC/upkt6W9g
         9xv9wMRc4dAjWubLCCl1zWo65DsPAwl1i/kwlPjbpHmbiBV1PVBJwIxHHbOPil125Tr0
         09uA==
X-Forwarded-Encrypted: i=1; AL+hErFh39Y7OfFtkgyiZw0snGbsaO+c7Wm+s6CtTpGASka7+3j4qHF+o/EW1Q1piD/b8HRvG22ijZLntVu+2KyfUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kN9d2Xuy1RwLIF5gftAUTSKUFotJHePPZ+krdbx2paVokBg4o
	KG3yMj3+kMRyVMFeRxV4SyLWjkx1m0WEA8zLEppWb0L927x7IuCG//j5plXAaWHOGJxm30hHa+t
	5TugKr9vR/lXBicqchcj8lnGuRq8Utxi42fgDZD4eyNuL1IuAJ2BO7xlZ3fBg3yvnEzrd3w==
X-Gm-Gg: AYBFou29QC13lktXPTgEj8Z+4eqd6hs5fHxapUo6+SZT7UMvlTVW5N3Dn3hXlnl+96W
	4yMyZFjnCwVKvBI8gqdWZUhXXcQJpnN6akjpLzarZdmM4PsipW9/npxtD6MRBx45E5b3x3bpt08
	LcXozdRn+8wkgMyoQvSnWNtJ35JqzQDjaocJpOfsxDs+5U7N92EAH17LbkAdOCze5St9g//FR8u
	naLX2Dyb4Y2rXf5Dzc643KeeB0YfVHJRPCihhcAlaJqkOKy9VlK7G/x+Dav3F6lPmAcM+DHg5De
	EARQ/qgxRsSghBbS/bohUlH0qDeGLxONalAtzYkB0oqba+ZePdSnUSD6o5RK8WYzeGSqQnBJuax
	UebxqQwY2J12s/rBSgLLEaO2U9Aumky5gSlulQ0Ud5pXzYgHBGnb7za66hddL9C4A0i8SEsL0Bd
	ZnmcxeEk0KZD8cCgMe1NNVEtqRjIVG
X-Received: by 2002:a05:7022:5f05:b0:1b2:558a:d777 with SMTP id a92af1059eb24-1b3c024f962mr3088784c88.2.1794442375234;
        Wed, 11 Nov 2026 16:12:55 -0800 (PST)
X-Received: by 2002:a05:7022:5f05:b0:1b2:558a:d777 with SMTP id a92af1059eb24-1b3c024f962mr3088768c88.2.1794442374490;
        Wed, 11 Nov 2026 16:12:54 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm18282294c88.0.2026.11.11.16.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:12:53 -0800 (PST)
Message-ID: <547f063d-0ce7-4a7e-9e1d-5fd587421cbb@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 16:12:52 -0800
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
To: Nicolas Escande <nico.escande@gmail.com>,
        Filippo Falezza <effeffe99@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX7Dvcybu2gH+i
 ITwwu/w2dfuHHrc4TDUIW6ExwGV2/enC0+2Abm3SOyvEWYbNWfLiMUzb40po7KyVUr90cBv+igy
 dPu/BZyByAamRFdt7UQ6vxuEmRjzTrc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX3239m3Oex9ra
 3gaK+oNiITg18yEIs29sJKvKffoxJiksey2LiY7S4LD2g3QeKpYZsc4kPnDh58Ejwi0FDz86Qfn
 SSPf3pBbgyGH81efqyda4/B3fOVdWV+8YmL5OjneVtXdgI+VI/YClFFL5KKimgJ7qTceTF5Qx7M
 fX/wwiOgfTC1yS48STzapJG16xBuWvG11NdCOIKZyPTU1TwOwt1wD5EuyX1AJaiq0uDc94U7V9H
 628+oqeWddh4xIGf/+bFBDWsLr3FBK+PSZ0ggLvsKzcjMYZnNSUdZEW9PTKbRozWjMhUoDZie46
 VWtU8+zb0XKlYbPpOwCFlxkGpyGVwktpnJeM6PFfN58zbBtg91QQ6uUP+V+cuQMFHe/7NAgwSEH
 1RmzJaBar/au4qGuNKL4ibyEXXDASwn8SHLKs/T1r4UVee49uWba9J3rP7RUWibO5q6kX4vJ+lc
 8Sacwzkw444UvmYBoig==
X-Proofpoint-GUID: ARF-dg2E6FykUZTHpaBrFnyhV-VWbeYS
X-Proofpoint-ORIG-GUID: ARF-dg2E6FykUZTHpaBrFnyhV-VWbeYS
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af50488 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=C5z_tJQPRfujv5IdwTUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120000

On 11/10/2026 9:20 AM, Nicolas Escande wrote:
> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
>> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
>> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> codename nairo (SM7250) never sends the event, so every read of
>> temp1_input stalls for 5 s, logs
>>
>>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>>
>> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
>> lm-sensors, hang for 5 s on every run, and configuration changes of the
>> interface wait for conf_mutex in the meantime.
>>
>> Whether the firmware answers cannot be told from the chip: firmware that
>> answers and firmware that does not both advertise
>> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
>> Instead, remember that the running firmware did not answer, and return
>> -EOPNOTSUPP right away on later reads. Forget it when the firmware
>> starts, so that a restarted or updated firmware is asked again.
>>
>> The first read after each firmware start still takes 5 s when the
>> firmware does not answer. Reads on firmware that answers are unchanged.
>>
> [...]
> 
> Hello,
> 
> I've just now seen this and it will break some setups. It seems that some ath10k
> devices that usually respond to the thermal WMI messages sometimes do not.
> This is from a QCA9888 that does not have your patch yet:
> 
> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
> 
> Like you I have a daemon that reads the sensor periodically and it seldom
> fails to read the sensor value for whatever reason. Most of the time it works.
> With your patch once I've hit this, I will never have a valid reading anymore.
> 
> So how about I post a new patch that only fully disable sending when we have
> like 3 consecutive read fails, and in the mean time I can also lower
> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too long ?
> 
> Jeff / Loic is that ok or do you have any other suggestion ?
My thinking is that based upon your logs we should never disable the logic if
the firmware ever replied.

I'm also in favor of tuning the timeout based upon whatever empirical data is
available.

/jeff
