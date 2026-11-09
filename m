Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794213168;
	b=oT3bMB6pRX2ecJllPmT4ocbCJCA69RCltzGBn/zzky67baXvsbOEySZ+PzO8XF1yrsee
	 TpeMst+l0IbFg6eD/YnVfRnSe3aQhZQU5q2H+5IEXx2XKo5Tx/fFax8y0dS5rNdXlELWM
	 XTeoanl7Jah/SeduCrxjn7QaCJZVQ6FvZWxocmkaxaXPDAWCsLHROT18AgxZEqUBsFelA
	 MzzWb1aE3LJG0GnABQPufqTj9j1QYkthb9YA1oPN7XTBOCNFLTli8knxDfsVf0b2+Whax
	 GS4WqrLonQT5l5JLi4HpN6vyb8XulJKXi38pT4Le0RwACv20knTLy4fbpB26WZFQOGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
	b=I0Aa3QWEzRI2OJJySjqKnYQ1YC/NCptSsYAZ6o39HyIngNcApZTLICz7aCsa6Fp4ccfG
	 IG88LJjj2SwBa3rUdpML3VfQBCYtG4Ih3vyUeOCuqK6anOOTWy7XP357WOj7QBBHtCvu4
	 lQfndSB5zrsN+a0Skn8ZsXpNNm0uE7jFdHfojompclZFJYl3kdY32xsloTfSCYAJQqOld
	 GgkiLmTuCZIbU1A97mJ8mL9tZd+R7gNFCf/ekrrc6PAxH4V8Qxogplmnsubze5gHCVR7N
	 zAfCzX8ou3ibDM0zQiYOfY2/ONIjoCecXzKrAL3T8TOlKDRFKdaTAaAMlm9QcB6/2rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTKoyUqQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FD6082BC5
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 08:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585FD6082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTKoyUqQ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso77509466b.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 00:32:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794213167; cv=none;
        d=google.com; s=arc-20260327;
        b=ngmqz9RvkWSuSS6ZtNfhwXJpxyLfhxpDeEXfO/yklg5h2S8Rw4ZqkPBUWOYaHVD0wr
         +2qMFJfhqgU9dRomK6F6e0k+gpSoJOB+VSS0NyV9gKCx1xtKHI7hUCzqQKPx7n92bYeN
         9mg8mtauCPpWzpBL6HNMy5PCiNSdDU+ieozyaQClH5CuNxl9RpQwYdFWCE8G2EhuQBiE
         kDHV0Uje0M375mh+NE6P55MDt5oKJoi5LavCqCODhpsvN59fWJcPdUY2gnsHIwrZv0ng
         s8jVKtn+9MPkw0LbdUfo3lsjBfymMiEy+DmJLr8jbQDzpaKb8Vv6OLTN7nTpgoeBr3I6
         WZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        fh=giIVYW0iihK8aFlijY7qnCl8zEM4KevF6wN2WgVr1+g=;
        b=SXnXwNgE2DG1D+amRTsBq3kpiuF4Q4pFfE2sWDsz0CLKOUP+7l0656+S9x5cGmNcNt
         7SjxTBCmQXjTnVmhgXiTyjJ1HwFqSy3yJG6No+1LwqtlStcDRQ/jK6kb7/rtlS701Mb1
         BOtXzSL4PhFzl8NlMTHX0dzrSgaJaiA5L+G+rOcASVwmS0HT+BpXVaoyDdhH1NUIHsMz
         9JBErh0kHuAyUosMV0MdwM3Qa7LOOSUMY4/bjczvra/2fPMDV1/nr6hNFCK2NuvYzi01
         Dc6QZg0U6NuMlWcoFqPrfIJP0xRfK0Scb/nMsrAhnfOLsSU9azO7eeUNNRJnGVLC5B1l
         HXWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213167; x=1794817967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        b=ZTKoyUqQOLTEMmtAocDtGhbxlOrUTuK15i8z4LV5C20JoFBW7WfAVZMO8M0vhD2W9a
         pE2Qaa/lHQFC6GJoP8bc6MuCbE5eZUNqlYv9FZ+nZZquNdYvGi7qZ7d2hW23OHrrLV9R
         H+AXQCqrKA+TimNW/wnUINexVB7uhkRMtgJV8s38Fp0Exr6dkp3lQ12pToTYjaffeW2l
         Nx6l+GxRs2gmIXpDJyIm0gbKR6ieHNzspDq894W3n8TgNuY99sv2Jc8DaoQ/RXW2Q9+w
         r4hcDYvbXsHvmIWG1r/AKCxra9qoEn5RUKQba2MxQJgNELDIdbuqveNBCjpxWXPihiH0
         dQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213167; x=1794817967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NukoXGfC0P2W7Y16ouCnPb9aSM3x9L6h6ebRRl7lnBA=;
        b=aRGoN2Cw7eYdZTkebw5J0su0N6QEdwLHRN7Do84YneHH6Vz4C6fDA0kFVWsfLhHfzf
         BaijKSzQOc4b/uLurqAlztSMvR/UsHeZjOwNhSSyDLyfm+kuY46Sw3OX6cbAKqr8U7Cp
         IfqWSk8e3shxLSSUds2jmMpFo1u+20FvVE2Tf548MgwjtcocTtgXjRnhEV82tBUluih1
         eS//3Ez8REHGV408CBQCC7EvtTYJkGd3OPRSWyMDyabQsOxUFs/3lRtpo/OAAnzghuVT
         QoKi3GNGmJqkuTu4EpZJ7116EiVyw+h9JAq2em5hjArD+SvfilAx0pitNNDhdXMuAV7j
         3Log==
X-Forwarded-Encrypted: i=1; AL+hErE7E1Ht3BFoCXRjVGpYoRnRGSO3I0TgeYF3JIa7cmzcKslxqscbTn2nuxGNrZ3PFssoUOQDPlMCISaSW2ym0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+94QhrxNgdvvxy4XhVyhr3mFwPqDBOjlJlfqoNHvbBsxFrpWeu
	p9PlHtDjL4FNqSnXoaJxMW+Oq7p8LwXOERLi1MNrF3J21HeXpqr2vpE8IhwUZFrxgxEQ8yCRqHV
	pkT9q9QMpmdbTHOme1dHj+B2bkWMGCWw=
X-Gm-Gg: AYBFou2vViDW+BAEjuYFqiiP520wbgtffjs/8UZ39uubp03TdJ4be6/BtcQ7ixw7wbq
	ZloRfO5nKJ32D/DPIBCUqMA0PxCvPGhgBfPcDDrT32ZDvxENgldi7jjSCcw197oAOxKSBv3i+pT
	xpRgYVJmTxmGHHSd14VkNyDdwqu5C1ZU/pyZ4r+4IKaY0FXjnDaAm0ZwbBDxILdTDmokL24DXG7
	COg8k5vEMgX2Qf9Mlc7ruFFf0ofwtZS7sa7yPfh/w3XWqmg8mtFFjI1edZN9H1Lo0NNrwIHGZwu
	WEqiBwykGn57ttJ2ZSlG3Jr7AxGoDTpaob3C1RKrLiSbzK00LaAkUmRLd/1ciIs6fsKPEAhiZXZ
	oDaelwqiikyuw6zKZUDowQYGG90tIAx7PwvbM3TRq7MiIA2qxlct3VHCVauqCa4ehqrcTzaM=
X-Received: by 2002:a17:906:4795:b0:c46:ba0d:3728 with SMTP id
 a640c23a62f3a-c4d6d4f2dcfmr235657366b.18.1794213166488; Mon, 09 Nov 2026
 00:32:46 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108142708.489067-1-skalpesh942@gmail.com>
 <20261108142708.489067-4-skalpesh942@gmail.com> <84AB3D74-F70D-452F-B621-B5487951B719@linux.dev>
 <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com>
In-Reply-To: <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com>
From: KALPESH SOLANKI <skalpesh942@gmail.com>
Date: Mon, 9 Nov 2026 14:02:09 +0530
X-Gm-Features: AclHuK9xFhiVuFOiQ15yfj3eynse4178ZQrsYyay_WeuFEgyDwln80k8c-8gbTo
Message-ID: <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] wifi: rtw88: ps: trigger firmware recovery only
 after consecutive LPS leave failures on PCI
To: Luka Gejak <luka.gejak@linux.dev>
Cc: pkshih@realtek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luka, Ping-Ke,

Thank you for the reviews and feedback. I have had a bereavement in
the family yesterday and will be away for a few days.

I have noted the comments and will follow up with v5 once I am back
and after lore/patchwork is operational.

Best regards,
Kalpesh


On Mon, 9 Nov 2026 at 13:53, KALPESH SOLANKI <skalpesh942@gmail.com> wrote:
>
> Hi Luka, Ping-Ke,
>
> Thank you for the reviews and feedback. I have had a bereavement in the f=
amily yesterday and will be away for a few days.
>
> I have noted the comments and will follow up with v5 once I am back and a=
fter lore/patchwork is operational.
>
> Best regards,
> Kalpesh
>
> On Mon, 9 Nov 2026 at 12:43, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Kalpesh,
>>
>> Thanks for the new version. Two comments below.
>>
>> On November 8, 2026 3:27:07 PM GMT+01:00, Kalpesh Solanki
>> <skalpesh942@gmail.com> wrote:
>>                                                                         =
    > diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/=
wireless/realtek/rtw88/main.c
>> > index a74f199a93ab..7009f8ae3e57 100644                               =
    > --- a/drivers/net/wireless/realtek/rtw88/main.c                      =
     > +++ b/drivers/net/wireless/realtek/rtw88/main.c                     =
      > @@ -638,6 +638,9 @@ static void rtw_reset_vif_iter(void *data, u8 *=
mac, struct ieee80211_vif *vif)
>> >
>> >  void rtw_fw_recovery(struct rtw_dev *rtwdev)
>> >  {
>> > +     if (rtw_hci_type(rtwdev) !=3D RTW_HCI_TYPE_PCIE)
>> > +             return;
>> > +
>>
>> The same check is also in rtw_fw_leave_lps_check() below, and the other
>> callers of rtw_fw_recovery() are PCI only, so I think this one can go.
>>
>> [ ... ]
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wir=
eless/realtek/rtw88/ps.c
>> > index add5a20b8432..fa3a4e476cf6 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/ps.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/ps.c
>> > @@ -166,6 +166,13 @@ static void rtw_fw_leave_lps_check(struct rtw_dev=
 *rtwdev)
>> >               rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
>> >               rtw_warn(rtwdev, "firmware failed to leave lps state\n")=
;
>> >               rtw_fw_dump_dbg_info(rtwdev);
>> > +
>> > +             rtwdev->ps_hang_cnt++;
>> > +             if (rtw_hci_type(rtwdev) =3D=3D RTW_HCI_TYPE_PCIE &&
>> > +                 rtwdev->ps_hang_cnt >=3D RTW_PS_HANG_MAX_CNT)
>> > +                     rtw_fw_recovery(rtwdev);
>> > +     } else {
>> > +             rtwdev->ps_hang_cnt =3D 0;
>> >       }
>>
>> As far as I can see this can't reach the limit on stuck firmware without
>> FW_FEATURE_LPS_C2H, which seems to include rtw8822b and rtw8723d. The
>> register check passes once the bit is clear, the failure path above
>> clears it, and I can only see the firmware setting it again when it
>> enters LPS.
>>
>> So if I read it right, stuck firmware gives one failure, then the next
>> check passes and resets the counter, as long as the registers still read
>> fine. Three in a row would need firmware that is still running.
>>
>> Would it make sense to only count failures when FW_FEATURE_LPS_C2H is se=
t?
>> Ping-Ke, do you know if only the firmware sets this bit?
>>
>>
>> Best regards,
>> Luka Gejak
