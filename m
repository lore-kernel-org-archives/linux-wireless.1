Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501988;
	b=PkPgYYqicnS+88sJW+Fc3k/cNQoJACX4z/XP0L7txSzU8FD67L4dmjzLd5rqRJYWVi4w
	 5OoPWnTNBz2O/jRGkeiw+RaAoI/AuqVHtKU/JEhKlKonCwoSd5JHcZ0jR0Ee6M9FUJqWD
	 jPfmRF9mzNGxrix7dO2S4cXlK5qypeJPez/PWiLkLkzb/MXc0v1id4hUtPGCZhLSj1Lkr
	 J58rFYW+n9Z1BWOdRxlkEvd4Bh7quIxW/X96s6rAHPmCBzTZDpVE4UpKh6nRa4BiRspa2
	 MWFuviKO2++mvbrOS5UJnj76nyAEmQEXp70AfL4zZJZb84BxRNTvxRfedm3O3Kbli8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=;
	b=yDXbdqmfsPC1D4IKiqqQ4WBsbrrKhSo1mX+Z7ZPK3CASOGa6/HOt2bP12mOyNiv4kX4A
	 XQJXbriGQQCsueCZITW1Ba5CQ/txK2oROFQsbsH4BHfhNqldfMZ7k3kID49w+vQloQFba
	 QaR0mOnibEeVYHluKtOF0uD+tQpmwBRUzPgrZZRcHJ/0FaoiVKTRoOc+nYShxD4yob7WS
	 ro0THnHnVVu6NJvpC0t+BQtZmIpGfD9vla25oyI+aN+32uVMyCJadaqAWGHaFay701nG7
	 anKIMiZNBaDvKPlXQ/8OrLKwQFSNWUzoFdGFoN0GnMoqvSYr6W+riWhSp3PIxF1e6+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEJkViFD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F220606A8BB
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F220606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEJkViFD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso73955e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501986; x=1795106786; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=;
        b=nEJkViFDC7XwEoFxw4MlQXdlp/S1hKJmlowUPmX4mQ4hZLEcbqXeXI7HEm/ouk4blN
         5VjMAWk8jiFvHiSie43Yp2GQE9vgHh+5RKwVBgFew1Tz5aR1iQh3MqczFvO7xlYlecU0
         nUyefcHkZi5F4V4SNmp4a0sehdhvcmzlZSHcRzHPC9zboM9pPO+UE2ujDllaMU+g5FTF
         UzhWV9C2RNsP8oYtm8AMOLPQ0uP9eNlNodwx5oSzaVo7uSejkDJL19mTYA3WRAZUXTuc
         1Syo3jxGYqANiu6MfXFqwBDeuZOEMmm9nS1EcJQnDzmRU54Uii0QnE0gmLDh+Z+/MtiM
         3X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501986; x=1795106786;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hY1mGgzLtxGTEpHomOXK1ai7FoNEbbvEwh94SK1e258=;
        b=Vl+kmz80WigLmgxjdKw+Zls/bW4hnPSKgMi+lFxlswk8gfcP1wiUKTvycGvoBl9T54
         1LwVeF4K8u36GiQbpxiF2wPma/OOfOotVFXo6pVHqmSfkXhVTf7AabwFoJTrc+U/p3E7
         tTSQn8grcTnfioz/3Fl14IuO+mTeyRqe7x/JJv6DFhjS8MfdcJQOJawVkWEXb3xEHkqJ
         BYvGEzpi6bXVf2S0iQUxC8HfJ7/5cd7eZ35XpsyRibZwao1WM3N6Xtq88Nbz36YAxyTG
         avxINf1l4vFCIXrs97LP7lzyYWQMudQ2ma6FfDhLsNj0RlOXvWReRlKtZIS54bGb38+i
         6ARA==
X-Forwarded-Encrypted: i=1; AL+hErGjW2+zBFGYxjJKZe024bHXBR+h+Uzml57hTOryyvVxi6OKITPAXBu11QbbHvTluT0lgV3Y8BTS8DYECm1SxQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jNIhlThTcLF4oQfG8oele1oh4374IANGFTmT5iG49CtXJSEst
	pND1/uI74EK9raNfLRGgizoavt0Nkkz+XSgAShSREbLoE8VPcVeV9uDYkVP5eA==
X-Gm-Gg: AYBFou0AIboTgy5J9mXh/40urAZcf9KMvQeYFamGyfe8PX5zPYQJvzWEMDZZywP/n37
	9VwMWePkN0Al7dvU2r5QBWxcfBEgS4/pEA8ipCO35uNr3t7RbmTgDCmCcC4lwMFlnD8uWnUxRZe
	1ZRjAYKawR/SS1+u0YkyBL2iQz7PWyJh3U65CRPBp4Nkq/uKDGb11uWgvuJw+6dd87N/L5p/kOR
	oGkUAkmxChiacjQuzXGM4xpdXKNbBsffDDhwoUX93ti6Y9MnqSqVUJ34Ho5stEXQ0CXzGOq9+MA
	7fHJPDKMCt44oMAMPwOCoVBwoeHiJfBtOJ6LZF8KzjFwDOGJ3LXC7RwWfYDrflgVH9t5XWIg1eI
	DveamR24sxphgpNTzY2R8JMX95vktvUSp3eml7misdNW4t9A0PLuZ0wcPf6cQev1X2DQsvjm0Ne
	6K+HAY6npTHAXCAPJZMMLodj1BUIc/EUsdmsJas/PVUcB9Y7XCqFuabooeaRb42LMRhLXVS2g/e
	TIPtsUhEQhXSHxQskIcIpxjmkfZ4eKc2BPbltHjmqh54f5yzywdoFD2WbaJXsQIoRqsgnBvXuHp
	vw3XliLKCzV20/Zcs4o/Gdzt0UD1LToAMMjWLy2CLvQAu5W8DUpt7NORksmYwcFakVwFbmiqETD
	VENOxN1ogPJ69Rzhr+mENhe5ax+Xc7xM7VpHPXIoi/Cffof0=
X-Received: by 2002:a05:600c:a46:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ba093940c2mr113923035e9.33.1794501986335;
        Thu, 12 Nov 2026 08:46:26 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb551c6bdesm2154355e9.4.2026.11.12.08.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:46:25 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 17:46:25 +0100
Message-Id: <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
Cc: "Filippo Falezza" <effeffe99@gmail.com>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Jeff Johnson"
 <jjohnson@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
In-Reply-To: <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>

On Wed Nov 11, 2026 at 5:30 PM CET, Loic Poulain wrote:
> Hi Nicolas,
>
> On Tue, Nov 10, 2026 at 6:20=E2=80=AFPM Nicolas Escande <nico.escande@gma=
il.com> wrote:
>>
>> On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
>> > Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE an=
d
>> > waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> > holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> > WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> > codename nairo (SM7250) never sends the event, so every read of
>> > temp1_input stalls for 5 s, logs
>> >
>> >   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>> >
>> > and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
>> > lm-sensors, hang for 5 s on every run, and configuration changes of th=
e
>> > interface wait for conf_mutex in the meantime.
>> >
>> > Whether the firmware answers cannot be told from the chip: firmware th=
at
>> > answers and firmware that does not both advertise
>> > WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
>> > Instead, remember that the running firmware did not answer, and return
>> > -EOPNOTSUPP right away on later reads. Forget it when the firmware
>> > starts, so that a restarted or updated firmware is asked again.
>> >
>> > The first read after each firmware start still takes 5 s when the
>> > firmware does not answer. Reads on firmware that answers are unchanged=
.
>> >
>> [...]
>>
>> Hello,
>>
>> I've just now seen this and it will break some setups. It seems that som=
e ath10k
>> devices that usually respond to the thermal WMI messages sometimes do no=
t.
>> This is from a QCA9888 that does not have your patch yet:
>>
>> [431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>> [435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal r=
ead
>>
>> Like you I have a daemon that reads the sensor periodically and it seldo=
m
>> fails to read the sensor value for whatever reason. Most of the time it =
works.
>> With your patch once I've hit this, I will never have a valid reading an=
ymore.
>>
>> So how about I post a new patch that only fully disable sending when we =
have
>> like 3 consecutive read fails, and in the mean time I can also lower
>> ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too=
 long ?
>>
>> Jeff / Loic is that ok or do you have any other suggestion ?
>
> I'm not particularly comfortable with such a solution but since we're
> already introduced a workaround, I think this is an acceptable
> approach.
>
> Would it be possible to implement the retry loop directly inside
> thermal_show_temp()? A one-second timeout seems more than sufficient
> to read a thermistor but it would also be useful to include some
> information about the typical read time for this kind of request,
> along with the timeout change. I assume the actual read time is well
> below one second.
>
> On the other side, since you've been experiencing sporadic thermal
> reading issues, have you also tried increasing the timeout to see
> whether that helps?
>
> I think including these details and any relevant measurements in the
> patch description would be valuable.
>
> Regards,
> Loic

I think that what Jeff suggested makes the most sense. If we ever had a val=
id
response, never disable it.

I've tried in the past to increase it. But that leads nowhere, its not that=
 we
dont wait enough it's that it never comes. Or we missed it, I have no clue.

Regarding the behavior of current chipsets. Ive added code to time how long=
 it
takes. From before the ath10k_wmi_pdev_get_temperature() to after the
wait_for_completion_timeout() so my numbers are affected by the platform it=
 runs
on (cpu ranging from armv5 to A53 & A72). Here the numbers from multiple
devices each running one of peregrine/besra/cascade

=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
=E2=94=82  Chip   =E2=94=82   Mean   =E2=94=82 Median =E2=94=82  Min   =E2=
=94=82   Max   =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA9984 =E2=94=82 88.9 =C2=B5s  =E2=94=82 85 =C2=B5s  =E2=94=82 7=
5 =C2=B5s  =E2=94=82 348 =C2=B5s  =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA9888 =E2=94=82 148.5 =C2=B5s =E2=94=82 142 =C2=B5s =E2=94=82 9=
9 =C2=B5s  =E2=94=82 418 =C2=B5s  =E2=94=82
=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
=E2=94=82 QCA988x =E2=94=82 205.7 =C2=B5s =E2=94=82 187 =C2=B5s =E2=94=82 1=
08 =C2=B5s =E2=94=82 1193 =C2=B5s =E2=94=82
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

So for a sensible timeout value, I suggest a few ms, even 25ms or 100ms to =
have
some margin. But maybe you guys have internal knowledge of the expected
response time ?
