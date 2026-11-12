Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502620;
	b=OC0Mx6wWf5iRDEMgLs40jqhAGzspAJfnY98ZmVu5kvpR8DHMuLnmE3AwZx25rLOISyEq
	 XK9zzZV0gNGXzlOcStvjUaXJSEIIrKZzhH57X8mCruoeb58+aRgIsJsqNzdoaF4ThxbxL
	 2pxTeDXIiuWL0EuxGPAz+7ffdMWGmYDby9o4AyfZhHMvS47W2QP8Wceeds+WZL+iVg3uv
	 nAGet+09IIEgdn+FDZbE1LI3HJiUjv96bIS63E6eAm4nXss7zqHHrc6aZhCqglueks5OQ
	 R+A7NyWejebT1T8U+C2OFIFlgVVnzc+7EVgas9JDM6+rjJv+8C6K/85dISwji7DTZGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
	b=hkrgwkF+dMspW/grpX7he5zjNK9XWTNmdxh4WVbg641rAYATjHv9O8IKUlkBRojkpllc
	 ma8ldmjIBJrdJex7KDivgfwRrgbOk6GChwdVFLUQ/ug8ZHPl7uVc35zBLXckMdI/blCQ/
	 hI8T9GuYoKVXhab+48RmitWyMv/5kwbnED8dGcSk8Qm+ikDia0eS9Ccw2yFsMkzdI8H5L
	 vj04lFW2CXmkVRt4U9QlGpq5yHpt1LGyBjshrAVfad+uHa+GDbWvrSiQjFidUIPryGPlo
	 m5oIyG78NfOIw8HAbn8BOfdEdKkAhvNL3ERT0Y9nWERFRuv/M74eAzDy2RX3WUJcdZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bcz5TGQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDdKorE6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37B606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D37B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bcz5TGQT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDdKorE6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACGRPRl1768172
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=; b=Bcz5TGQTsdCyop/x
	qrQtakQQtXkszBZNjJEiuRvmzikCasRJw9HDDpNbnP3jeByhcINBV1J7leVHBMXB
	itzOhHA8A/xz3nCrwx0u6+lmKqSqq6qV15O9o9thuOStEVeqxO4whP49PY5m3EXd
	X+u0AsWStBIKJNZtyh8eOzzgmlc7owxGGJNj+CqoStj6+i/xuRqQ9WdU8+HCvR23
	MR/tMX2cpV/5G0U09NO/lNmd+LvO+Oxyvnl+Ytrv8/HY5xmrBkIiMaj6eGJ9F+65
	IzdrkaDlLoQ8Y5p5qSlCLGeDAYwk+P8fWP123UO2s4y9dcci426+dCW26hYtARJR
	Rg/dgg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ag3ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:56:58 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso7305806b6e.3
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502618; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8WOkjAdtWgj8zUmoq5mB+6bcwrxlyzEtSK6ukUvO/GaK8pDKH5u/j01kYEH9s3FIN
         v4ScTGUcqZbf6I1/eVqgm6iXWxxNiBg7JKtDJlFVhBUcTHoEjZWtRLSBfzthH/q7I5Hw
         Lij42Cd/JbAKWncZsVtIqNCgPmqqlyxS7idLkrVMfSGOHuhYZ+yIh+PD6dSDGpW9k2Bt
         +iG8uCV+R66EecpVvm94Wm67OWovewQvx9ioI6lvoPmd6st9ekMrVZyYmWeSQAhXpIkU
         Z1xD/PxlpnrPzHD5lhl57gb+I2C3rwRWGO1qMrtpP1ed2xvv9DrsOEk/lL91t5FEAIDH
         /+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        fh=OV0eA/dZude4SSKZPn2M/Yg7ye1WYNKLl0FO7IagKB0=;
        b=WoNMK2ETdxWGgh0tClPWt/9dqgYFnqrocgWP33PRHQJefRjsyPYR2UQtuvMl1ote9K
         fgN/zci50TNzPZ5tRU9HBGmt7Ff5He7hQQU6EMIIsmAmx6YmJsrRCG+K4cIWLp/M0ygy
         g7D8w8TwyKjNE54lavs71ccBM7cou/w7uwMsKJPz3gTxLSdGpFrBIS5TD+VVmGAM5yeP
         H2rxXa6Bv5ttUOMD/sI99XyG+4sV/Gj7WAp3V2AYKidmIkohv0/fq7UTJ1wc81wwSOoH
         oyT8lLL1ilFza9xE47LlUC9kXLNvrMEyfZGnGcowlJ54RtJOnSVXuYlgszmaInYYQ2n1
         GjwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502618; x=1795107418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        b=FDdKorE6TzZCphO7KPgZTIfAvIOnGbHaYGEiCgWgrYrkq3ucFEoZ1h41PttAx7Pjln
         TmDR7UiymBB0DC4LFe8aOZKUylm5mwyNWSz2nVBF/ke6xIMky5JnCPYAXgCG+L4V4HSv
         P3imVctRGe4FR+yhohHL4hgK2GFf7EE5ZlJw3fn4vC/L8iRwu9GPwbZoX8gUzjtiePJ6
         YFSALZCr5qNGcCkXNwFb0rVgDMxfCARsybhKWAAQXvt7s3BnGDWdMx4jeemF3gGXMWW4
         cpRlmra1O9VVeQzwl6tJ+KrEvICnmlhpjfiZM/lwY56J+SCCNYuCyFRiYMAc4PbgyrqK
         KZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502618; x=1795107418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRjlbPU5AVtf9EK1IKurnyPbNjAMOrscQEXjpMumO9U=;
        b=TJ8Vm2QjYbEdl1vAxU374bp6SHfRZlEgBl/bN0U3bjJULLa+PcvnM61ran8M7Zxja0
         qQOELwv9hYBj8WrbmhoiUd4RCVd/NI46457gv1FT+9Fj0+WxENFr7lyvEOHye7zrEq6b
         77oSVDpXANipMgJhKshfYR9GxRcw93S/qSIi85J2Erc7FNF0KOm6lK7ZuSiY5yPiq9r4
         Wc92httycGcnXNP7hEHo0F1rloB/zB9DNpWhCulFsfHOln9ZtF6ZZRcTriwrp3mwuvSP
         XGhJv+GjPJOcwa3kBN9PvBVn7ZxHVOwY3eQ6pnrjk11RiZd/J4Cifyi7JPYOPrvjkQOO
         6Lyw==
X-Forwarded-Encrypted: i=1; AL+hErGxyPkrmFYNaqWZu5e1eB1eKKn0q38cUJo27/wYVIjm6Ry+99fajnUyIjYPBtUvkt07Kb788mfy65yQ2n1jOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+A/sSsl9vNYxpeDmXGpcmp/R6c/wFZTbg+JXQ207POeuPahP49
	ieI9CGINBPfaKHoOOIh2zXHrmr7hFNBGHybpVmrzlBsNYbLwc46vDHkwxUHo1PFINhLauRd0KpG
	3ewTts6YaP48MdDXZi+q58+SQqdsy84BRjXpqqBHJKnbjXjANF//9HSKME1jKN0olKY689/844s
	t1XcaMBbiuGNUwA9tsJLWXzMX3rLcqMrsm9TJ0Z/lWuK35
X-Gm-Gg: AYBFou1Ae2UaRTJyJobfgXQIVCg4J61eNnh5/K2r7vYkfp4PZxSQCELu1Ia7zf/JcvE
	+rQfeHc0r4qQw2ibZBed12IEH/7Kt4xRvAWNVruxbyYMVLnmdTnmx2gjFgQpzChhgeIiF6bOXas
	KL1VXTEASX4+jX9C1Ak4nyPaTkRbam39tltlWBTp/ALR4PRi8S1pw36JRV4DTblxF65a/zE7CYS
	u+nevoXIcYyXrK7fpj5gN1PPTufZJqgtgNvSm/bMPz/ivtN3Ak6C/Ej8zVDZ1nUT3saOStXkvg=
X-Received: by 2002:a05:6808:1793:b0:55b:f88d:6eb2 with SMTP id 5614622812f47-56b9344bd80mr6050532b6e.6.1794502618089;
        Thu, 12 Nov 2026 08:56:58 -0800 (PST)
X-Received: by 2002:a05:6808:1793:b0:55b:f88d:6eb2 with SMTP id
 5614622812f47-56b9344bd80mr6050504b6e.6.1794502617512; Thu, 12 Nov 2026
 08:56:57 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com> <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
In-Reply-To: <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:56:44 +0100
X-Gm-Features: AclHuK8kw6CKHb_cdjRA4WaRGGYqyVwyIm_3dyHy1Bz1q5JMBMCptBcM71ms0EM
Message-ID: <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Nicolas Escande <nico.escande@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX9Tfdc5ncYTJS
 Escm21T8j/W3ll74cNgspV2iJXJXYpMjJxuXrTkSPsmP3s2GzqUwn2Npokj9w7RQHSwAFNVrtv5
 KVzYMeo0i7b5I6mK1Ags8ISofhjhQ7o=
X-Proofpoint-GUID: 3buJ9aapVjlom_njf1LLFDcrQEr8SyuM
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af5efda cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=OQFpW5qx3RqhGcwZRAEA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX0Iml5CbgXM64
 eJ3Uo6qhHWLKeP4M+yt4QFJJqcO4cfNuzWIMDETL3WrIPExhZKKhR8067U2m1V/RNvPp5/KsDKm
 4IHPWxlT7ShmniGi1BSqq0p3OTwTE3P8cCjjZodheh9Onryky4dEZPYxffKUfdeplJZT5rG1qxV
 Ea3Sd+RNw2xyum3DoaO3Bg6y16yxOtANfdpVkqyOZKLIyEc9w9aFsj5wvyzN6gZ7M0svcRWApL/
 96vAiNevB9EtMeZG/tXT+Q/T68EVTpsQPEzNt+bFGn5Ddvssr2KZcJ+Z/q0gEqEm2aq9u9ufYAq
 1HddoIVskgTmyl4mz0YQ4WriZea8v6kfvbBUZOYD7wdk1ro9PKxXTTVykfYxZ+mXBthfuxZdcel
 N4onQd3gdDqRQ6KatAhIajUAEPndeFsZ3xE82JpdeYGtOMywX779VU39WVDYaFXILQ2l6393x/D
 u/JixUKcoU+UCqdPUWg==
X-Proofpoint-ORIG-GUID: 3buJ9aapVjlom_njf1LLFDcrQEr8SyuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120067

On Thu, Nov 12, 2026 at 5:46=E2=80=AFPM Nicolas Escande <nico.escande@gmail=
.com> wrote:
>
> On Wed Nov 11, 2026 at 5:30 PM CET, Loic Poulain wrote:
> > Hi Nicolas,
> >
> > On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@g=
mail.com> wrote:
> >>
> >> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> >> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE =
and
> >> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event=
,
> >> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> >> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> >> > codename nairo (SM7250) never sends the event, so every read of
> >> > temp1_input stalls for 5 s, logs
> >> >
> >> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
> >> >
> >> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> >> > lm-sensors, hang for 5 s on every run, and configuration changes of =
the
> >> > interface wait for conf_mutex in the meantime.
> >> >
> >> > Whether the firmware answers cannot be told from the chip: firmware =
that
> >> > answers and firmware that does not both advertise
> >> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between device=
s.
> >> > Instead, remember that the running firmware did not answer, and retu=
rn
> >> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
> >> > starts, so that a restarted or updated firmware is asked again.
> >> >
> >> > The first read after each firmware start still takes 5 s when the
> >> > firmware does not answer. Reads on firmware that answers are unchang=
ed.
> >> >
> >> [...]
> >>
> >> Hello,
> >>
> >> I've just now seen this and it will break some setups. It seems that s=
ome ath10k
> >> devices that usually respond to the thermal WMI messages sometimes do =
not.
> >> This is from a QCA9888 that does not have your patch yet:
> >>
> >> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal=
 read
> >>
> >> Like you I have a daemon that reads the sensor periodically and it sel=
dom
> >> fails to read the sensor value for whatever reason. Most of the time i=
t works.
> >> With your patch once I've hit this, I will never have a valid reading =
anymore.
> >>
> >> So how about I post a new patch that only fully disable sending when w=
e have
> >> like 3 consecutive read fails, and in the mean time I can also lower
> >> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for t=
oo long ?
> >>
> >> Jeff / Loic is that ok or do you have any other suggestion ?
> >
> > I'm not particularly comfortable with such a solution but since we're
> > already introduced a workaround, I think this is an acceptable
> > approach.
> >
> > Would it be possible to implement the retry loop directly inside
> > thermal_show_temp()? A one-second timeout seems more than sufficient
> > to read a thermistor but it would also be useful to include some
> > information about the typical read time for this kind of request,
> > along with the timeout change. I assume the actual read time is well
> > below one second.
> >
> > On the other side, since you've been experiencing sporadic thermal
> > reading issues, have you also tried increasing the timeout to see
> > whether that helps?
> >
> > I think including these details and any relevant measurements in the
> > patch description would be valuable.
> >
> > Regards,
> > Loic
>
> I think that what Jeff suggested makes the most sense. If we ever had a v=
alid
> response, never disable it.

Yes, that's a good suggestion. However, we still need to define when
to fail. If the first read attempt fails, how many retries should be
required before concluding that further polling is unlikely to
succeed?

In this case, the in-function retry mechanism could indeed be useful,
provided you can validate the behavior on your platform.

>
> I've tried in the past to increase it. But that leads nowhere, its not th=
at we
> dont wait enough it's that it never comes. Or we missed it, I have no clu=
e.
>
> Regarding the behavior of current chipsets. Ive added code to time how lo=
ng it
> takes. From before the ath10k_wmi_pdev_get_temperature() to after the
> wait_for_completion_timeout() so my numbers are affected by the platform =
it runs
> on (cpu ranging from armv5 to A53 & A72). Here the numbers from multiple
> devices each running one of peregrine/besra/cascade
>
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90
> =E2=94=82  Chip   =E2=94=82   Mean   =E2=94=82 Median =E2=94=82  Min   =
=E2=94=82   Max   =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA9984 =E2=94=82 88.9 =C2=B5s  =E2=94=82 85 =C2=B5s  =E2=94=82=
 75 =C2=B5s  =E2=94=82 348 =C2=B5s  =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA9888 =E2=94=82 148.5 =C2=B5s =E2=94=82 142 =C2=B5s =E2=94=82=
 99 =C2=B5s  =E2=94=82 418 =C2=B5s  =E2=94=82
> =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=A4
> =E2=94=82 QCA988x =E2=94=82 205.7 =C2=B5s =E2=94=82 187 =C2=B5s =E2=94=82=
 108 =C2=B5s =E2=94=82 1193 =C2=B5s =E2=94=82
> =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98
>
> So for a sensible timeout value, I suggest a few ms, even 25ms or 100ms t=
o have
> some margin. But maybe you guys have internal knowledge of the expected
> response time ?

The 100 ms timeout seems reasonable. However, will it actually help in
your case? You mentioned that the failures are sporadic. If we happen
to read the temperature at the "wrong" moment, is it likely that all
three retry attempts will fail as well, or would it be better to wait
a little longer before retrying the read?

In other words, do we expect a short retry loop to be sufficient, or
is the failure window long enough that spacing out the retries would
improve the chances of success?

Regards,
Loic
