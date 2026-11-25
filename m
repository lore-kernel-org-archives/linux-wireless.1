Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795583216;
	b=rfshvRm1+JfGCzaupMKG0nA7TE28kutrHrdAEkje0WaqCyBSZUmq5y15/BdhQ3vjlFSG
	 r7nLqs/80kpuzMlaVNv9CdD8mBwRN42noW2LQk8+0ux0pptW+9HU+b4xIFnwc03I4HeVn
	 yQhFgEfPqcbyGC2Bwz1IsEIaYVvgTx4c0bsLDcrRp/JVPAfiGuNI+3zalULPvzjj8muE4
	 WbK+lqHLjXDLZQwqEU4JJAtXcEboVk5gNZCi6C33XLx28RXDMDN2bYnAlM7/Pkzwqneme
	 HPwX8AttlITwfQEGeCuQ7liFEGh0k4FKVpJfkbb+I73Ai40GSTinn+M71BDIeGCQRGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
	b=xDz6bCHX4GZ0DxKth+JLiml0ZRRX1LgrIEytHoT+lQUGs1eCjr5Rt+XYIKjj6yFBbCDu
	 iNFOYbbIVLXosvyg5RXlq56nh916aSwTsImS/l4dJ72Vxtv+upXu/+w1FZSR/i5LH6Ipa
	 uroqFuN1ANWSs6p7cR9yxLz/Al5N9Tae0S8Se0+osfXyfVx3e3BZEg/zrG88ssxznK73C
	 KyhLuK9jHa5obAXHZai3gp4p4sttzFw+KxCj2fZi2jjd+cglAew4RegoSCWXt7PEj3eDN
	 QCR+NWCEr2UDKQYcIGZEvj+F3ZxZzXy2rJ/Wr600zbXbCjbgAZYEKGaVIZWEonoVPCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4;
	arc=fail smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C4606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 05:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=WvCW1Bg4
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so6957640a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795583202; cv=none;
        d=google.com; s=arc-20260327;
        b=CO/2hQDrfcKQvcMmSoGNDKd332rS9FFOGuA2lYyN4G4jZ0zx4opF0kq0bFqp6Y+aVc
         eHT2vXPQ4Wm5/tBRvtDxC7cjtpY0/iVgscV4Yzijha++ml/QPrQY+Q0NeYQ7urhI7guX
         MR4EQ245QGOWNdveqjFks5VN0mkP9LpTOILq9Jfaubx7zDDtwk2EpO5f1eVdu+HwpKGn
         bKrzn/oEtsnrgf3vhVSewbBGf3cPMTNm/LFUvEHyIkJBCllfKD92JiDQC4euYcgNGb0L
         ak8bBk4XxpAz7Gsc777+zL4QXPxb7aCuYcnSQqyUGjPtCudAnAtiFoaiCKrNYin2iAGI
         gOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        fh=/3VJFtJn3ae/9CmAUirthnHWabP06AMypOppg2JTND8=;
        b=QIOg6HbVsEwXhF5lOrhdJLx9f7yWNq5GDrLf1Y4xcTueOqYMPfPGC5R2zbHc9PRkV6
         ZOfFJ433mHFPpiKBiF4tZRfdGzrQlhm+CYC5IbQoXQjo9rbZptOQpdiv3W+VcyFkoL4P
         1bMK1JT5VhJFNZDx9gZJ3fKS9ZSrG/whT/QZD9frgx0RQkWSWLLn/am6JV4yVHV+isws
         W+19Kiw46XFdFe4JbDFMGGUkJKubS9AwE3nw+q3x2ZqJxQ3mhg5oRa6RPJ5spg+nSDPb
         tEyasKq4f7qTc1kHYmqQLHc5OOQJY2HtellVTJAhJ09kwQ/6SGOUt9+WPXdPImaOxyWq
         Ms7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795583202; x=1796188002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=WvCW1Bg4ViJubZeAEI0wYclnYXwKcIfPWWaMc9ZYTHNFKwJAVdCHcNiTzHn6PetD/3
         myrf5RFaZ2plYTw8GPMbuKPDxhjAr/O539xfOwB3qv4OIeo/63IuHPGAvb6uMnWgI4DO
         0LoFQkv5PtCnVQ9jmUSzUtB/4qlHMRW3ijYiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795583202; x=1796188002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=St9qGG3raKOdkDcDbquwSocgYR27/42BAaGi49zTWXE=;
        b=MiwCSqgPIvmA1y/6LhiDeW8xC11S5+zdNzjyt0tJ00JFGbIz09s/+KUhrOY1j9sAZZ
         ItIXtCXnP+8d4rMPRFgrOwkt0WqlO0tVYJ4jQzX5SalrTJ4CItnb5ib61Htd6SJ3gwhJ
         XBWnAZR93pz1dq03JAJnBpWuV78Ltm5IOZmTSsYYy6zDsgtZesCu9uPquWrv3fSKoFm0
         LsDHe5cfpdcHzWO4y02hzB8bpGZvjoliODijhJsVtnh+Rz/djPUOZwj4nk4frnawbDBo
         JPcJ/n1E5U3GV0+VeOVZx3lqFOQ+PlTsa679JnLGYOkcH978qqD5QXWGdI+BIv5EPDhf
         D5gw==
X-Forwarded-Encrypted: i=1; AL+hErGoi07ahHi6ftamCquY11uTWahP/d2XehbAM77XH79gB1nzcmMRcbF1WJqppMFdgJVTep9S3PXvPnamhuS96Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+N5xJCbWZgHrtWhfmkRxi0ABesUQL4GjbxlAYBpoRiIrz5Ekf2
	fVg5JDYsu0qgZ93sD+P5m6Aj/pOD94f3mSkuAazf7gby2zPU7KUPazWqE4ucckCrXzNEtNca/9v
	cGww5vSQ8Bn3+XZpJe+Kn/djPJatkSG13lDCpMezfcA==
X-Gm-Gg: AZFdTZfylX4ChQhlHa2gKNP9S3WGa7wP3RMDllyejp5mUi/PI1pOnGm49/u3ERZM3tF
	+8Qv9WJSY7Mzs9oHspbqMa5sS69b/C7O0NEHWxLSBLVKv0F7jf47xqj/XLb/kdK4yiMkk+ro7An
	ACc6Dmd/TtjRA525M2FAFN8oMnysnERmauGXQcu2EHWv+04PeO9WyicImrlaIBTcIrvweiK8hrT
	zpffTpPfX+HqFXftDminj7I6WZ3Giv72UXV2MNqzQq8ACdGECAqLikg3lrmd8XUaSF/FMZcRD3C
	8unCwaCATaj19COrFn2zJx5frx6JQ1UCDyyZktCedlVs2Jo6isaL8HjYsxcsLDdK07G2dsgWXy6
	wNiindmn1pkqu/vXR7bjjsA3T0bm6afjQtKLrBu4BPJlBQ9Gj8lrH6zd/1GFUEvZhj8bXzxxYxt
	GxnJmcCit1GcR/5ldt5DAppOHwZ9h1mWwNIy8JuCxi3I+PJOhksPBB4fw=
X-Received: by 2002:a05:6402:504:b0:6b7:1cd4:87d6 with SMTP id
 4fb4d7f45d1cf-6ba37d17fc4mr8799911a12.13.1795583202056; Tue, 24 Nov 2026
 21:06:42 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125043847.885053-1-piyus@iiitd.ac.in> <179558178888.3294.13943698848591637747@kernel.org>
In-Reply-To: <179558178888.3294.13943698848591637747@kernel.org>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Wed, 25 Nov 2026 10:36:30 +0530
X-Gm-Features: Aa3M54oDWglR0iAUavzHNeiehG4Hg13FhPc-XMGjpMFLClMWzn6h4NFTqVwgfFs
Message-ID: <CADq=QSx-7eYx93XbdGLTxHp4-O-=gO_6VyS6R4XgZzDXMG_ErA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mac80211: store the mesh IE blob's
 length without truncating it
To: netdev-bot+sinfo@kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kapil Vaswani <kapil@presceralabs.ai>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

The bot is right, and the information is in this posting - but under the --=
-
line, where git am drops it, so it is missing from the commit message itsel=
f.
Stating it here as asked, rather than reposting:

How it was found: by AI-driven fuzzing built on top of syzkaller.  A genera=
ted
program put a vendor element followed by an RSN element in
NL80211_MESH_SETUP_IE on a mesh interface, and KASAN reported a
slab-out-of-bounds write in ieee80211_mesh_build_beacon(), reproduced on
mainline 7.4-rc3 and on 7.3.1.

That run is what found the beacon-tail overflow fixed by the other patch of
this series, "wifi: mac80211: do not copy the mesh RSN IE twice into the
beacon".  The truncating "ifmsh->ie_len =3D setup->ie_len" that this patch =
is
about was found by reading the code around that crash, and by the review of
v1 of this patch, which showed that v1 made the overflow reachable rather t=
han
fixing it.  The two routes the commit message describes - a blob length tha=
t
is a multiple of 256, and a 257-byte element behind a truncated stored leng=
th
- come from reading the code and have not been run here.

If there is a v3 for other reasons, that paragraph will be in the commit
message.

On Wed, Nov 25, 2026 at 10:13=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
