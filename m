Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414655;
	b=PTz82CY6KeO886bNSlxQ8lKMFrQ0y1/JCBDrHyK0XAZ21QF4Zuttx1iUO7qFk1YKpo/e
	 z3uuCP0NvE4KFSvaszT6Zf+A+Bt/TjP9YDI+wycVRP/QWFUJyFpcVsFhs6PuINrdlbJri
	 dcbMjMmfyVfkSOQNbpnwRxddE2b6vu85OH93Oo5pOvj0AYnfXtwhIXl9wFHkhPKi+qbKX
	 sF0UZlg2i3cl8qbVZQWB68p4jWHH4dnJQ+E1bk0VS2uyxdEAekJIksxONdYqgdRD8H5LD
	 tZjc2YsGRVfLc5HKcDNhXZCaztPxOWFtPPi3OLOhjLemof2FFBsVQn2UOcl1BDpWCRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
	b=RYEQzoeCBrQORq/oPX4uYC4QGCi8u/WC5AXLVMB4W/e5jUtqVvEp3iYa4/ewXogCaLfK
	 E/3z+sZGGG8GjtcP2nOHg6JkmKRFqq9i4oFtyv+DlxsoTJLp1x+OC4XUT9Jx7og7wWz8W
	 vgdXs/kpHRc/vLNj5PTs1i3ZGcD8YH9oDAoSBOdIHN9MTamwk0TGcn2XsG+oyoOQAqLqj
	 +MtJNMKSHMBPrFsWM0nMtsGIdp17goRrjEoBQPiz/Xt04uu7SDDE/kOlYWOXDplKJHSVt
	 9pJPWUubY/2/lkgy6UPGDi2parupZ+wrakiFh8knIOH+oiUUtRovlzO3YMiMt7X7fNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aRQglqVZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e/5Au+Nd";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA29606A321
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aRQglqVZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/5Au+Nd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF182Y2115578
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=; b=aRQglqVZ/Wv0RMx2
	YktCbDiQXZ58TE284J5LEt4oyVR3DB99T5lk89sEjeochr1cM4fnAXUYjxMKDiuI
	mu4oCNpeRKLDgIgFoVODLR7Gj+72Q9wQ2mUb48UYkjlXcuOLxSxQss/Ew4lAIAfF
	FUIgzIOEh1EgsrrYMP5yDwRLDMLxw/9cbhMMNMOT4kH4jlzOii4ZDDRaPGviOmGu
	1CVt0Z7/2rx6BnKeXtyH06NlDWhS+3iHJXqQy0/ZMoMh3KR3TSGa5zDrqnKSy952
	SuyqG7S8nxou2tiulvz3K1O1Cw0jjaKZPFfnkaH+x1Dd0pSOFpowpWkbbJ00VLsG
	MK2RUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk1wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 16:30:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so690367285a.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414642; cv=none;
        d=google.com; s=arc-20260327;
        b=j/D2GWI4/2yWH4IQW+VpS2+eR0EuRZkfp4zAGzaeXRXeTtRSJDjhr6bLMful3p6EbY
         WhueQh9cI9yMQjbY18vhR60tZJh+fqdg59PHDpMOGkGAlT/RjflSEkpy6R9RecCiJ2QT
         jlsRzUeaNLsQu9OviLpUV4iF3X7smcyxoL4yjtdCd9AUXnYjwi+fHUrbAlsqSnA6E0DL
         4lGnsO9ClLd2PnpixUr4WeLY8f6iKbhQG8V01YhcYJBHaEdBFlo8Ee8K+2PN3DD7k5In
         ybvoZ0MTrNcR2A05Dx3xW9YfdPyZKdAnwoe9Y5GujhFJgWZuEr56fmNHpK58Djp/zlGY
         nmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        fh=wquYgKp8xCiJJqJcfe8Of79OjADDJHMVRy85XZoihM8=;
        b=Vt25OHK5M0bnWnsaZm17ZFH6fAFQrnJBFlSSgHUjFhgC+yEZJWXKxpvdklSOFXd3nk
         h8lIKryoE3MRhjVbVmTfjOvPkoaOHmhNXkCFIQnCTfkDEbgoHHlTiG7swaa+YKZGO/Li
         BptCkq0WVRGjG62m1e5ObAfouoIfuI29NCkBjJzd95wEL8oicStuYj46JREurlIyB7qo
         2jf4VgLO/XfawVrPzmGW/nVfHKlmdqwc2i7OwM5kLBBdM8OgiZTJuLObcD+46kD4S5gw
         GqEg5akPVpaho4/AjP4THXSNxxzoHiJmOFDJmkuibefv5LhW3VAAV89b4S8vA3hkx3AO
         4BRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794414642; x=1795019442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        b=e/5Au+Ndh/kAjMwAKd/cxBr0uXU6eyYvyrkMk5T+H3kIjYGp4BOeYjFxgalkK8VS/3
         Vs+QE7RcAvZTlfxj3nphsDrDll9+jp7w7ZG0eYAIVT3LHRIcAUFTZL5XQ0bRxDaB0baI
         Yw5dR3OVDeXJ/+tm7awd7JZEkp50WI/qnYlogZ1bQP+/7RjSOepdl4P9UkqBS5s4EQtN
         9Uc3/zWOpr6hUWHDM0OQOvblMW+0Rt2A0g3x0mHSCHEBVdKVexD9gr4yj0b2CnzOKVWF
         ZSENqICe6WSbd26LR46MwZ1ZOoR8jau8Ej7w6yH5hbpzPtBh460MPFbw2eHZjJX9ra0V
         NBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414642; x=1795019442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PezgUi6Zl4WfSYcCGZsZ3wRvLdN1FPFdZHFthHDlPDE=;
        b=vsCMzumCLNDoU/b0A1YqCzyGT5RxuUo+qabGnaawQJVpH8V+QwsnOIb6p+5cs9xpKK
         GyUFODAZ4x8mRvpfq5lV1W+ImAJHUvS3r1i0NjNR5dRn9PjrXs0g/6RdPaau3BHipjYw
         TvTVCVJ3IPNRMjmp+StBmyTEfCGhxtbIJhzey3d3lhdOuCE8POM6Gxs/4dP1z1jxJFvp
         iKO/bITYydPKZIRPNA/7X9l02BkhwSyFZtCTn+CJXye0SSc0s9SpDT46Lih9MDnBapXR
         6JwLK0UqjOwz9PnSysEXS2giXmu+/bF45PbfZt563LQV5uFCTGiy5qaypJhtNaAFtzXq
         1Z0g==
X-Forwarded-Encrypted: i=1; AL+hErH/wLEz+6mIzm+Rk3hc23gRcmWPs+CRDpDQ3C/5X2D7Un4VQTzHHeutzl4xfLYpl6MY8ThHFtjcIkJrwZVrUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XssrltFvTHzhRBFVQlXALQ/Mtmmxg/7lFaeZIMPymUikrxfoY
	UTAjYZSi6Q78IyBMs0bQ8+fC+FAitmr44YjP7U5nL16wLbVZGZWSKHQiR6deBU63uCZD2xX0Hrx
	X7J2CfhFH5LVLem6hjuET3JEp12YoTklFQ36TYEvI5pNausU29a7/dOq0YFj79ZxqXwE+mpKRdf
	bvrDEGeN2e6CPIkW+qZOEg4th9pUW06RhPYNLKuS/GO42f
X-Gm-Gg: AYBFou0jZNZcZ6+18NSrR71q0941h8Mfx1NGVHAwhgA+xLFZOce07PmGEXX9zC2O2vd
	H/U2r/lMshwITOZB34ti4H5jrAK6ygrA7MUqt5GM8N1j4hyRGC3Q/1K0mAbpU3YHurPNzKcCXSF
	MayvFK21OLu7VIJGzYSvlTu1Cd4H/pEbACUBXxHjeh87AyOf/b0CFEx1SsNTglDLvYqz6WyYAlF
	zN81/8+aQuXFfZBpNghZbZFKTdYqAXv3xEvZFV3FEGduWoPxYkr5tQ/X5l9gBokT1Ebhkr72rXD
	uoz1Aq4/PxvOxiZOBMM/UUMxAvU=
X-Received: by 2002:a05:620a:6c01:b0:947:7f5e:2b63 with SMTP id af79cd13be357-947b003de74mr446224685a.34.1794414642188;
        Wed, 11 Nov 2026 08:30:42 -0800 (PST)
X-Received: by 2002:a05:620a:6c01:b0:947:7f5e:2b63 with SMTP id
 af79cd13be357-947b003de74mr446214285a.34.1794414641405; Wed, 11 Nov 2026
 08:30:41 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com> <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
In-Reply-To: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 17:30:30 +0100
X-Gm-Features: AclHuK_23C9yhGbenZKbQGi2zAu-gPm_Fk9HJBo5HPAoIFCAUkkHa4BtoGtVqdE
Message-ID: <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfXyyBEmxyUY4Xp
 tLixYb9S5YF01mGjypO3S4lZyjla4Cq+LYU+DQf1e52BXzayrxWz/gtETBi/gDbkEAwOBxDAW95
 y5J4YFJPNvmgmleX8cOea1QBFq8bfmc=
X-Proofpoint-ORIG-GUID: wDUJ_Gk_eoCrd4qUDug17qTXqYR2sUJs
X-Proofpoint-GUID: wDUJ_Gk_eoCrd4qUDug17qTXqYR2sUJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NSBTYWx0ZWRfX8eC7hTotmyKG
 UJQEioGCxJLhyZn+ND3qEBC4bPdqeJWuWF1MX7NwilFotnz9RIm6Sfc7AkpQ7wjaH562oAClKaX
 S7wnSFEgFxfzsmTUYz46D7muN09xHaQy6z2FD9Za8EmRZfVn4sYYSEIdjDO4RScNVj4eUHpUZbk
 7qWOVxZ/da2iV28jPJ50JU2AzUgnuy+Y7XxSTexL/zgM0N+Uk71UTbfpXJy2vSc63ZwacfRFBki
 rcEvTcCgmOeWhAIqgZHeWf813k/+B9eGbrSBoCgL1LG8/BGQnzSA27P5/WiOqBl+XC8+5dXzufq
 TTCLiohTaPA40y0MPeLrads8Yrdmb21MNw8vCECYeKMM7KEVbNigo7mpSVdpS5b2UzehDentBZ2
 rUaVQ8wFnw1QgjvVwrD/P6Di8R+oD0Tq7icwv26io4hPIps3ITyCSwfwcqubUosp5fl6Pt0hytx
 aD2WWOOxjBPf4nlEcqw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af49833 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=PFt12ZtUnVRDP-aAo5UA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110065

Hi Nicolas,

On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@gmail=
.com> wrote:
>
> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> > codename nairo (SM7250) never sends the event, so every read of
> > temp1_input stalls for 5 s, logs
> >
> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
> >
> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> > lm-sensors, hang for 5 s on every run, and configuration changes of the
> > interface wait for conf_mutex in the meantime.
> >
> > Whether the firmware answers cannot be told from the chip: firmware tha=
t
> > answers and firmware that does not both advertise
> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> > Instead, remember that the running firmware did not answer, and return
> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
> > starts, so that a restarted or updated firmware is asked again.
> >
> > The first read after each firmware start still takes 5 s when the
> > firmware does not answer. Reads on firmware that answers are unchanged.
> >
> [...]
>
> Hello,
>
> I've just now seen this and it will break some setups. It seems that some=
 ath10k
> devices that usually respond to the thermal WMI messages sometimes do not=
.
> This is from a QCA9888 that does not have your patch yet:
>
> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal re=
ad
>
> Like you I have a daemon that reads the sensor periodically and it seldom
> fails to read the sensor value for whatever reason. Most of the time it w=
orks.
> With your patch once I've hit this, I will never have a valid reading any=
more.
>
> So how about I post a new patch that only fully disable sending when we h=
ave
> like 3 consecutive read fails, and in the mean time I can also lower
> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too =
long ?
>
> Jeff / Loic is that ok or do you have any other suggestion ?

I'm not particularly comfortable with such a solution but since we're
already introduced a workaround, I think this is an acceptable
approach.

Would it be possible to implement the retry loop directly inside
thermal_show_temp()? A one-second timeout seems more than sufficient
to read a thermistor but it would also be useful to include some
information about the typical read time for this kind of request,
along with the timeout change. I assume the actual read time is well
below one second.

On the other side, since you've been experiencing sporadic thermal
reading issues, have you also tried increasing the timeout to see
whether that helps?

I think including these details and any relevant measurements in the
patch description would be valuable.

Regards,
Loic
