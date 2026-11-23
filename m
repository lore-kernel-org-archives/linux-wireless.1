Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468216;
	b=j+plmGLBOUZbN7JEbvh78jUH4Po2Ng9vJBC2QM4m3PRASAcoo0w0Z3G1bW3XwLx0B6U4
	 EH2vU7zYWzU7fcuD6mPzFpb2/kyWsbEyXGnjWWH9kd3FoBh1/R7LCoA4zG5do4/yGXUqF
	 5kO42puvqpMMa2ggcjw6Pums8rJzMMrkQ0RaKdssglQhE30h4VGyTFULye9a9QfNcVgAF
	 Ie+6qaY3rR2v+Cap5ej6R7ntmRqaaZ/goeAv516pSlAdfK6hzCnzzvrZzJN/SRuHDFfAa
	 4j8xWRjvpTzgEBQAsv91lbfQkPmSYtJ/gkwe8KhVHpeMblPQ6dWhDnykZQVZm2D3t5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JGPk1jGj43xHjZVB7ZbHFktO3l1LVla7B3cwc4Ca4M8=;
	b=r5azTiz6VpO5V1nn4xp0dxpEI+4jNYGRvobq10Q7dqvbxz/Wn+airDxdX67qEdgRkl2G
	 Y4q2lhoQR2o1NJw+hyBknyewddXc6ZFmjTXrswfxqryGWfhEb8TTbkp7kFGaMyiIn4tZd
	 Q/z3Rz496iYV+m7kFHxcXP5yPq6ktO3GBvONQlVwUimOlrrYCvOSk4q/O/o/wgu20nu7d
	 jFIJrvwYw/HsZxYLIFR8Ww87xF/4h4tW0whmkHFCmmlue09RTg2WFkZr/hRInO6YjYGRM
	 d/zRDz0SzZeAFTPLb1Mrq6KgfqwNtVOjU6TUJhpwp/uYAoTchPuILBrEqk2rEx7EwTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJU42Q4E;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72882606A326
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 21:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72882606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJU42Q4E
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1784285f8f.2
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468215; x=1796073015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGPk1jGj43xHjZVB7ZbHFktO3l1LVla7B3cwc4Ca4M8=;
        b=OJU42Q4EzLcmW05/pvpbjIt+qS62TCEuHVALNf4TYDlbzmZQKujPKMn+IcZOTTIvOK
         Cy495l4Zs/1YWdV8UbKtIuxw3RuQEkHS0/E2yF3/WXhXfHzwpibkxyEJ1W/bd8qREkYP
         meGI71y6WLdqdIj2KX+HRBcRAjji0O0R+evJsZJH2VbbN5NdozMoo6ebPXsIhlLbeh8t
         CQUHdLaWBxizxxQgTcNdR8+Rjrk7bhoLJ+L7REO4FTvIn3xOXeER7vPOxLTcQBF2OvP2
         3gMM6hBdFMR7DFYMhCkj89IPO4HP5U9qnBuwZnJeMLiONk04cxpWGPwaLjplYB/dY6EQ
         VHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468215; x=1796073015;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGPk1jGj43xHjZVB7ZbHFktO3l1LVla7B3cwc4Ca4M8=;
        b=r2QKJzcZqflcwVnyCdHSSEp3cM5R22ttGpGqIWNSyjPTCJXacWCCnyrT0eM1XDcTNx
         Yy3LwwSVgCgLia9ey5sCmJHyfCeh3OB6FcV0N3PrUzJNSY+OcuOoq660hOze8CPS+O+j
         DRb1fMGFG35w9VIULza7WXZGSrhO3rbHqCIWr6ishbXyXumH+rbOLdHnKgtuxY3hfDiv
         8eu4XD8ldOsDPwGiOlynl64Y9Rr7upphnRf0dXOe0DA06B7Mlc/EIyFp+YlKlLHKXP9b
         Os/a7TEFyFkLl0kTorgWDwq+zU+OalZIa3nGaVlSKumH8le8g+EL5yusanhDJ+fYeCd0
         RxNA==
X-Forwarded-Encrypted: i=1; AL+hErHao3s2zKXvRkRcFOW/sbE5ioocNug810DVglqcG0paj5YCsYfeuW3YQznzXzhIj6xEAUaAR6P3FYCkapECxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6eWt9RzBqIjDCWnJ2jbFWcHFRPG5Q6+lHPf369w9etkP+CLdh
	F+LFKBzGSOLzL/MXsvQUO/nkXmo+XBJe4qTbLcpoVJ5XOllA+VtBIYNk
X-Gm-Gg: AZFdTZcN5M4y1xJhsh9UHiWSgP6Oc5sgZrlcR+nYBZweyn4kgpWEdqt6D79IHU+wdnG
	IWinUpKqlTBvFHxLiq1QBKoc0OEgec7O6jg3fx9B6XuhXM8BNHW6uZJuvzX5pt1FpIDpoO2uz2p
	BSMdRSLZOZtxU0fOrLH9y1CdVNw2TxPiboQlCwEbSHT83e06CgUNJVNse4fC5UmlkkFD6ys4sox
	Ibt3HL8z+qAL9ZAFVofvW6A7tQbuiOlQQhjgcejWHeFC9DXL67DNUUImsvQHkKYBmFkYeVSFQo+
	r8TUdVT0ikW6O2oWOYXPCU0hDfiwezjh3D7N3M4qgcu1hjwmuxCtf0C+2oHjDsSaQSvMda6IpHO
	5RR7BwKm+MJDrgGKHhcU6T8BTyYu7Zb1EJsbCeVMqMK+NsIZzNo5ghDbUF65L7stPDpuA55KJTY
	iF3SBd9/CgpGb0sGWUmy9B9bNsy+LgJIkjgOQA8EsIs3lERkFry5gVT4AWjNGwkC31KNN4gO3Gr
	dYt6scNJeshgN/+v/NFm7kgeoWai6t6x4Z8aOUNyRkzBQA5M3oonvxVrATpBy0xy5IQHNM8mlel
	Ef02S8SkC0j/l8B7rDU7bXjOz/eFvQN66yXgtY8=
X-Received: by 2002:a05:6000:2b8a:b0:4a7:b365:19dd with SMTP id ffacd0b85a97d-4abb4b85bcbmr16572843f8f.53.1795468214803;
        Mon, 23 Nov 2026 13:10:14 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm23721755f8f.36.2026.11.23.13.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:10:14 -0800 (PST)
Message-ID: <8226a69f-0c29-414b-8e2c-e01103819d6b@gmail.com>
Date: Mon, 23 Nov 2026 23:10:13 +0200
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
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 0/5] wifi: rtw88: pci: Support an older design,
 like RTL8821AE/RTL8812AE
To: Ping-Ke Shih <pkshih@realtek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <2033f1b1-fb12-4a04-aef4-923590e64463@gmail.com>
 <aaaeeef8-1d4b-4d31-9f70-fb7d781d7006@gmail.com>
 <62b7f8e8d9784877ba8eda4bcde90cc6@realtek.com>
 <08a6cf57-9c00-445d-bc91-9375e4ba2ef8@gmail.com>
 <1c527c2ba8d64740a1b1df63b80f6ad7@realtek.com>
Content-Language: en-US
In-Reply-To: <1c527c2ba8d64740a1b1df63b80f6ad7@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 07:48, Ping-Ke Shih wrote:
> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
>> On 16/11/2026 09:43, Ping-Ke Shih wrote:
>>> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
>>>> On 24/10/2026 01:57, Bitterblue Smith wrote:
>>>>>
>>>>> Theoretically rtlwifi supports WOWLAN, but it doesn't work for me with
>>>>> RTL8821AE or RTL8812AE. rtw88 doesn't support WOWLAN with these chips.
>>>>>
>>>>
>>>> Actually, this looks like my laptop's fault. I tried with RTL8822CE
>>>> and RTL8852BE, and they don't work either. The wifi card doesn't have
>>>> power while the laptop is suspended to RAM. There is no option for it in
>>>> the BIOS, either.
>>>
>>> If you have an external PCIE adapter, it will be possible to connect
>>> an external power to keep WiFi working. (Note this might damage your
>>> laptop or WiFi card if connect extern power to wrong hardware pins)
>>
>> I don't have anything external, but you gave me an idea.
>>
>> I soldered two wires on the motherboard. One connects the M.2 slot to the
>> 3.3V line which stays on in S3. The other connects the M.2 slot's PCIe
>> WAKE pin to the laptop's power button. Now the laptop wakes up when
>> I send the magic packet.
> 
> As the result, I think WoWLAN works fine when your platform in S3.
> 
>>
>> I'm not sure it's working 100% correctly. RTL8821AE (with rtw88),
>> RTL8822CE, and RTL8852BE all disconnect from the network after waking up.
>> Isn't it supposed to stay connected?
> 
> It should stay connected. Have you tried connection without security?
> Also, I think it'd be helpful to dig problem with air sniffer.

It's the same without security.

The sniffer shows that the client sends a deauthentication frame.
I think it has something to do with NetworkManager, because if I stop
the NetworkManager and wpa_supplicant services and run wpa_supplicant
manually, the client stays connected after waking up.
