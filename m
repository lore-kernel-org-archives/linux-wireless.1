Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795453767;
	b=XDxorxALQ9eV6e784bW6v3DLjtHbLXXR69aqHJ3JhROwzovfPV4oyyx02TeJPvSvoL9Y
	 MahB1/2DIf7mKKWuVF92rO4EwdBa8X8yOYtDikJYRLmuKq5KnaMPxixdwm9l5rmGS8m8f
	 JMB1fu31SiMSQURiljofDWo0HsX675XrRAany2OUHso7JBaHqaGq6xKVAEBEwFqaBpqo4
	 B7TAvw/24ajF39kyiCnJOu0lh3mx0+YIWzbyYP8aVTO1ez6iC4I/1Zf0RQX4XSHV7QUIa
	 hpSzI+6OoIOQrlmyy1BiFTdxwnlUah4zpug92AFuUgxQ/5eo874SVFArWPLBLwQkHLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
	b=KeKlyEAyAB3uiKZSJJpm+pi0OG+Hn/5P9XH9oice3v/oNhA4oALAVDp1+EJkt04qqAvw
	 C9JmqXmIPhTCGr5Z5EiyZyVFAw+5K+uTNpMk/rPIFKmM4H/4nk2+HF/a7aCNgd2mPo8Aw
	 tdGao8uTOuKFo10j/SScW4+/WhnH/UJp9x7X3tfvYxiGxxRgzrtUH6jJJNYiuv7qodvBP
	 kTEia5807KL48pLhbsTmbDowzzRZPavEyYcSOeW6+T1wHIgGMdNIBfCesbhPECd51XRQG
	 n3u0e5U+1SkEcZlkHfCp43nH15swsd8bvgMRM0Z1pieRZXsI4aTCtfn7KeWbHPC8+iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlOPitY2;
	arc=fail smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C2606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 17:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlOPitY2
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-48e9476e26aso1191342fac.3
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 09:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795453765; cv=none;
        d=google.com; s=arc-20260327;
        b=lcVURRiqpp2J/lKhc14tbbhQVHAZ9ZiEaW5bDgIn8xlJK/NctoVcTEPmEiSNx4OFn9
         40BS2D7lP4Aiiux7sEQsa7XTkqSxfjKxo+5Z8un9bQyLcGB+UWOOY3Pm2i/PW2IUsPZf
         KP/o5COrP9rqm9whNq9aLe8vQD7BLlQuBM4FC2EPygsR6XlJZPcHNURaaxMQkGmhvkt/
         K0vZ1E7xMp8dNn0X9zf01f0cStwZdkAzppU3mM/XqlPS3tFgrnTFEvSaZ9K4LUFx72Lj
         C+UwoI1h7gBqWD8B0jd+YNhifKGzp6T1ljjNlyhbfL36RmNUPZoubSaYVZCPuOFGsXva
         vu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=cK1oo8ZKS3C2lxzKjbVSOk0yNL10WhoUbAhpNu0xGDtXSwWagNVDQKMsLcMm5C1xKN
         XYRBUNdv+KIeJBGqhctQ5b0vuoLj3BM2toa50pTPurrhwYXItQZ9XkIPf1XQ2BLcm3j2
         YSCFfk3nOsJE4ys6gs4P2ZU1FUUvT1tkfhTI8hW6+7wzujenRBTGjCJs3COMM2J/C5ex
         AdIsVUmbntFS+kwV/ORbWPt9bBbLUgBV4r3b2OTVCPrnXfDGDibtQe5F961wJbW2cIdI
         dtyRd+8VUISabeaRl7MusuoYoeHD5vylu2XHGd1NbkcL8dt/CSz7gbcdbcXFq7AVu8W7
         fQHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453765; x=1796058565; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        b=qlOPitY2Buuta2NKhfIC8ihTl5lKc/rmhPKb+O41MmVX1/G9X5LG0SwJ0wHRTm/ECo
         bnXFRpCgzSn5WpxzEKapeCXNqCTyJcZ6Z7gg6yHJnRYLGk42l5ojm56PBBhR8Kmi2MF1
         cxy1oj4FkbzW2dTONKs9ymlri8fFlP2evX9jIeqdAnQHl1a7+FRPyVLTfyXWaB1MAftd
         n1xAxUcPqNpPpKxhn6sfFMhgZAIIUT+zYic9WAa3S/cDP9S3wCWvc7cOMZpgqzfM2JQh
         YpZgCqCzQZbCCaPnUhG60VTzB6V2N4TKxJv5rgHTzc1heE5JusBz7bDg0Oq/2hSZVM40
         BqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453765; x=1796058565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5t5JP4GO9Laq1Lv8Hq7DQj1ZPWjPnYaLMekX3WEbiFg=;
        b=Nm0R0EFbcNOUoXcWcfYrhMyY2A6tTDwoED7NCabggbUYdPuKm/C5zM9M2/EHwm8XCm
         8cWHxG7T+JUY34xfMpymuxTG3KdyOe1COoWT+0/KL74JchnDZW9edvqmXldYV5IBwHg5
         xSbdURnpE4F3O4LUaWBCEnRGdLxyCn2DGKxA9+ksXTPoaI52r7z2Z5o2gXBiNf8m/StK
         4BJ9GjTmuxS1mcKSeDOXAoyEzYrW7qGi0C3jh0/unFoSQ526Zn54BDWbrhoaoMcEwr5a
         w6qEvw9YMRA6iDWQNtuKBi22Gtm4njBD1udJMnIRCg/XS4e+3hLu0XqTuO1WIE0xovFo
         vJBg==
X-Gm-Message-State: APuU4Z9jEsgnkPW0GTrRzgNBEO8e42MaGxv+/AoM+43fsAWrlqug3zRg
	qZMuW+LzOSHSxkdR7qccQGGhy/fZlI6xEehvG5AbuKbQf6AGSmGEgnk3rXxgS4tAFCQysOJ5nrY
	mYgas6yA3haVeHFaNVQNJma+Rppdzuwc=
X-Gm-Gg: AZFdTZfw5CDP67jJBFe9nYLN5bFh5tqIMxo3xm4LdqQgJH2HaYEXCDtbyOhublAI2DC
	bso20i5S0CjViIplrqPrc1IzBkwCzL1ebMvS6Y0rFCLPUaByb9yajFWugfp0hFb/uOqPMkiOLCQ
	Ba5Sq731yGXrcQbkkYDt6We8vQXhisL1VkU9DplEfue9+r/au0YdIW7mn0kBBGW4RX/zoIyDCfV
	GuGUM+k8Ay1CZDbL1jnjBjpMNRP6dAo+3wGlCBxEZXgdCw4WkTLIIcfLnlZdi4b/eGXk8TfObkG
	z0pSUc2vS8rRWFDE6+JjThuU5Cdps1IzYDQxZWHJZa0RwpdB2/2isC0IZ67qZ+J8QslVB+yBwod
	jkXLjxUs+PB1p65m2PSO2MdZvyNwMoImi1Dr58c4+JZ23+bBqoDZ3zarygYGpZC5jiPhJnkO60V
	BdgjPmp4+EgMnE/RXyu2lk0WMIHc9MATk=
X-Received: by 2002:a05:6870:4cc6:b0:4ad:8800:b277 with SMTP id
 586e51a60fabf-4bc82c96091mr11693060fac.24.1795453765399; Mon, 23 Nov 2026
 09:09:25 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120113116.153232-1-hjf3108@gmail.com> <20261120113116.153232-2-hjf3108@gmail.com>
 <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
In-Reply-To: <1f9ad0fcc61446fb8ce49ef98d5292e8@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Tue, 24 Nov 2026 01:08:48 +0800
X-Gm-Features: Aa3M54oVM5aty3xWPhSZL5u0WDH31EPxrmoQScFCe11fczaCvx4o9mUEUFn49LQ
Message-ID: <CABOQOSV-vbUazUTwb_Lt11Wv3-47P91OswOsH6r2=ngxOUcAKA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 11:28, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > rtl_tx_status() starts a TX BA session for any QoS null data frames,
> > so these polls start a session even though they do not carry data.
> > That costs an ADDBA exchange.
>
> Will ieee80211_is_data_qos() be more suitable?

ieee80211_is_data_qos() only tests the QoS bit (0x80), which is also set
for QoS null (0xC0), so the BA session would still be started.

> >
> > Check ieee80211_is_data_present() instead, so only frames that carry
> > data start a BA session.
>
>
