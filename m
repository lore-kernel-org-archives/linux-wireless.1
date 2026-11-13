Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559848;
	b=CdAzPNups4aQoziNuqUgrRdo0pE6CuVi2Y0H5xyRKaAhgKeJ3oj/UPK2LKGoI1Bhusrj
	 I6sYfE453KuhRaiJHK6yx6kTVzbcfyDZvmiMbrnjHv1pD90tdZTKQn4x+kes50cVwMRW6
	 kMG/YM2FfSkOWK5TnAuK4p8inVgBsvN6zJb9BBgFpXnx8oic/UeWxNGYaahdFR7ylOO1M
	 wfCktWdB+gVohBqJPh+MPKtbZiqcET5zFh1HCyxPnC8KTRa5YD150NgZxYnEs2REe2USo
	 EaCzrA4qDQcQVx4QZpO3rY5GXT3fhPxq7JK1cFvlMKm6KQfkWpo7pCjLM73hKVsdJDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=;
	b=Nb184FbWvomjdidqBM4kyXdnpgn6MDpdMRKqeUnTB6BnH/YB09EPQ4zMm39oFMo+5/2x
	 ukNRe8RzKT3lLkIPtLSC11UEz0/i5kLvHp/wRFmSrYOeAL0JE8ML4KYmaY+0ZL/OWREng
	 BXnywJFnKs2shbnWdLEo6drGJ56yzLz5EutuVH5NSJ6Li0z5+mhWYMW2CGkGVuA6DPpms
	 1xV4IxrTKqUnha4Oku32fAsGitjzzlQwX7Mc2LlD9jIjitdpsSw6ObJ59N4itSf5BQlkK
	 3O+uHuuyTPFGdpf2ePNJUJrRaqG19HNTUNj7iXzk7IgdGNNhuSgzE7hcFQMrO2r0ZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJkwIpow;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fh1Y9Eju;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B737606A33A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B737606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJkwIpow;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fh1Y9Eju
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VA2l074791
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=; b=IJkwIpow9ogfW2fQ
	m3W35OepDyE2IeMAUlBf8ddxQ4b3vqu7LR6Tv8iVitU5xIPaC5Dwry3rLcQJAz9o
	b64qjlUPvfqpFJ2tgkbpf7xWzznxNzINa2BOUylA1zVRZQIEteo8kVShgsQ1bCqi
	xe4L9XU8YaJAfXME6vaQQqdgBy/eKknTC/ZIb5/0mlVMLAOi289HWavCiFalOYZR
	czkPVWOEzzJVff7MCqBUfUBDTRWAng+RwLSNyUO9fA3FFENOLnb9VGXeopvvnZSB
	lJuKNSb1ZAWcVTYUbVh1j8jnyYGjjJkAe/UhsTBJ99eKP4/v5HrqoEH0xfvzzJAM
	N2IYYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhk0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:50:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so129972285a.1
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559846; x=1795164646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=;
        b=Fh1Y9Eju6Rx1HfWgmCCcvaXlMmNbdsXR9zoLQ90AHN+pwf9sT3FRzSiLrBe1SlEB5C
         Yx8RFwXRl+A2jPYBZZDYVMpGhiNDbk/IWy6TtRxeV9jBppwFOQ7df6WnSkdnU+xpxBfR
         cw1xUPpoLk2qcNyeOh271o7zwgRJEXN5hxcVTAk+hVKqvSAawkUoM/P0lP1jGo0Hs/LU
         /oh1Rtuh3v4/zj7RQg6Peu/gVhCDRJ/u1gq82xaUu7Lc3snjql8BNY9Uhd2tx83uK1Oi
         tvLSpP1gJrixdrTZPvDTAKEdDxuEHMmyHfAgYUhPRDHPL7qiNpwLwXuGUGlhFwZw7s63
         o1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559846; x=1795164646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=;
        b=thNvV01GwXeaEV3xFeWHmhYlO71pQVSiZJDrUqVOnjcafA+ZDiUPygLVIYvR9mguO/
         zp9zesY3Q42cbMtgOtCa8q9SoTFZ8WJjYikbi641x8ZVIQfhtSgJIT4ovM4BnZ76AYFY
         dPdSK04D+uaZkrPJi8C+Z1RauA7QyxRgRPrjxfSQEPIRkFkYR5Vif4QMu8dpfshqbSZJ
         2OU8QnAnAkxD29ptZdqWk5OedPJoqYpIU0VVh023C2CDSz0HeudYf5zM2mkFp5YLxLBP
         Cu9kl+JT4WnZ699WU19PU73eg2NypccQnaq4lJqRb42elXp+nQtU4zor+J+w60dmfFa7
         lReA==
X-Gm-Message-State: APuU4Z/BYg8SpfZweTd+MmdDqrqXWCU6PjCOnnx58wSJO3MK2N18VGoQ
	dhOVQIonDvnphIQxR4mQSrKmSQELwj5y12+KOcyaYVT+at+BwtF6hgxM/Zks/Ocz8tr02BmhiSV
	lq5z6UZWojwb5l6BFvvG7cQJUZGBuVEcq0ezCR4F7zS5Sy/J6Pkjwfnxu/w2nB5R/gryNutr0mh
	fGAQ==
X-Gm-Gg: AYBFou2h22bHeMKVXVIeO7z/pdtHOwuWtcMrMxJAKwDdU3P6Q4In2QmU4u9/bIpVRif
	eG4b8rAR6c8Jow6eIz4n5bqkecD4tlwl7Druu/M9j23mPHP8Q0TpI7x5ZPcq919k2Ogrs2y97ZO
	7hvcHRs9+K09U8yZvHHOYs+OKkvNqpGmogyR6fFSgLB6v9FmGEPuMabSpDESrmBcjhspgYwCgLQ
	KblG6cYDSloSTtW/Q/+xs1XUmLfbeiQLLrZ3jhlq69kEH903V1AgpTAJ4GnHwpijOE5vqrzTwTQ
	6wT3ap/g5UuFUnE76h7lpZgCHAKjGFuOaJScf/UqrYmLhb6Zt2ggcIx0I+FRj2SKLl2ykaQM+XL
	3Hf4/2iGJiIaJPROgDxNLJGAKtsFgUPjHuEHeaTe0zXnPM6mBEeFXqllGqNoxHWPBFn75u+Fjlo
	mHzWB3VpH9KBS8Dft7m1mJwuqO2t6j7uQaVMbtfzWa8KVuVFCIbeuRRWRusx3p0UZtRniYem6Tm
	higm2VA3+IaBR0g3xRSKhDzvH1m5tY3/m5VSwixJDGUf/w99A==
X-Received: by 2002:a05:620a:458a:b0:93e:ee21:70ec with SMTP id af79cd13be357-9494bd1c166mr307094485a.80.1794559846503;
        Fri, 13 Nov 2026 00:50:46 -0800 (PST)
X-Received: by 2002:a05:620a:458a:b0:93e:ee21:70ec with SMTP id af79cd13be357-9494bd1c166mr307092785a.80.1794559846074;
        Fri, 13 Nov 2026 00:50:46 -0800 (PST)
Received: from [192.168.1.17] (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566cec2esm28891835e9.1.2026.11.13.00.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:50:45 -0800 (PST)
Message-ID: <9a9a6139-2a0c-4166-a17a-b4fc6eee75e7@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:50:43 +0100
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
Subject: Re: [PATCH v2] wifi: ath10k: add USB device ID for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, ath10k@lists.infradead.org,
        jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Content-Language: fr
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
In-Reply-To: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nzqZ2425OS6vtF3ZP81kfSfgIp4u3e9n
X-Proofpoint-ORIG-GUID: nzqZ2425OS6vtF3ZP81kfSfgIp4u3e9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX+WAyQ4npC6Um
 KYA0a8oOvIMBeLa76d7BhGgyFsnm4A9zU1aAPf6KlIzgcnYBGAAi+hE6y6gCdCRjcNqLtSon87R
 QF4Cy6Aqlpog/P6jyLUprAUMAvWsX7eQwXu3frDMBvSeRqinvo5yComdBGZcFvm/SvmwpfA9DcQ
 qewHvnQltjJL8TLDPLxMxJ9yQA7mIQgSt3WUsao67EN70M7gBbaWan2q3WWUoXEoi+UNKGZrMm/
 v9Rh6Q5Arfzfrtr1r+wAMbW/mK84JkC/Da6Dl2sjOSgHmfJKkVFtaCxMRhHq3elPQZTiOLmvJLF
 E+KZQ3YE0BLLVU7uuRP/d7v/VVyr55lpmJBvi4BW9q3ANsYQqxEZPYkjhQga4K5B+Ie9uSHTnbW
 GJUIjV/o+Wit2xX8ca3ZrZRqg8giSi/O8oOGr32N2kD2wPjRpb6EVDFt+x8eovi6jxwiGEjESQR
 TqUQ6SRALv3YwCQYSTg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6cf67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gxwPz3L0vLWTIjLkPhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX8B9/Ei1BfU9T
 oh2m8P+GX2Ze8Q+0TyS+lkrJelTX1xsZ6+yvVoOPafO7ldZNdyJLGoR8KpbTPA3xSABtEBKyAGU
 RY+1UYHJ+zZtbxLuPZ49p+ScwlASTPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035



Le 05/09/2024 à 08:59, Tomas Paukrt a écrit :
> Add USB device ID for modules based of Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>

The VID/PID matches QCA9377 (WiFi5 - 80211.ac)

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>   drivers/net/wireless/ath/ath10k/usb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index 3b51b7f..60441ff 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -1106,6 +1106,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
>   
>   /* table of devices that work with this driver */
>   static struct usb_device_id ath10k_usb_ids[] = {
> +	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
>   	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
>   	{ /* Terminating entry */ },
>   };

