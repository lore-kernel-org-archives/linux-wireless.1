Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824327;
	b=njECK/QcN3SQOK60AVk1skL6WhFCI2j3iHi5n5XFw6ngtCN+J8vraCji4XNW4EEFNefl
	 2X3MxIPnwsfSGU+OFKwG45PnaTvsbVmo7HS3nJqFIZXAfVAYZ/K7d+3Tz1nbGD/LdXrb0
	 7WenWXcYqOqxvab7IffXI4AOB+goywuElbd3mWQP2J3gQcVAceJuEQvWx9/Twslb+/tQH
	 MbxDDJEu4f/z7WQOJ6FHucdP0gglzqCB6sF3Xe9IrhvxseK5shpsspiPYubUBiXnwAHQB
	 oKrgAm44AfMoDPbFGqMYqEYzBqawEZWYhHNee0lHT33hYumoRBr00y5iZTstdcW3WwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Content-Language:To:Cc:Subject:
	 Content-Type:Content-Transfer-Encoding:Feedback-ID:
	 X-Infomaniak-Routing;
	bh=CTsqwzXC/WNVLHnqflkybsHwEuMnueq6D9e/S7BK6bI=;
	b=f07a8oYT5JnsbVWt1FBOZir1srzGz3o1XVPmE8atGTdq8JUw75Xxoc2v6oXa3R83pwi0
	 DcEy+C7SKeG3ocvhb/PdJSabzkr/svqCSF4N56FITnHHlvqiat9FbhiB3H0PQ5QiqRdzR
	 uXJ2yBnrz+liF2Zl/c1UnEi+Yf3lzAX5gq0eNadwlJaGvY2ihMXu0OftdW35e7x92M2YP
	 pm0BwhvsYRHKDqSdCZKpP5gd2PDa+wWBl+IrHZtvTB4i+VViJs43lVeZx3xjFLWMwMYHt
	 jWKFoRIhLSjgYiYq3YKxu0eXcAc2ksUpFUdoSCdJ2k5DpT2fbCqzBNEtcRDwOzhHSpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=etik.com;
	spf=pass smtp.mailfrom=etik.com;
	dkim=pass header.d=etik.com header.i=@etik.com header.a=rsa-sha256 header.s=20210927 header.b="a/HpRzk6";
	arc=none smtp.remote-ip=45.157.188.8
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93927606A321
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 00:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93927606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=etik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=etik.com header.i=@etik.com header.a=rsa-sha256 header.s=20210927 header.b=a/HpRzk6
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000 (Postfix) with ESMTPS id 4jbrC274LJzhNC
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 01:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1795824318;
	bh=CTsqwzXC/WNVLHnqflkybsHwEuMnueq6D9e/S7BK6bI=;
	h=Date:From:To:Cc:Subject:From;
	b=a/HpRzk6K+ZmeyC+oKsfheCL0i1ukOocd2zB6J7DEj6hyYi+EysnFxE9TV0F4Nzj7
	 MRse1JaMa35xZdjm4rDgY3fW57AVQ7MTsjeGuElM42tU0NUQxaASLaoavQ1O0p7Nl+
	 FcxlwRMfupwTHL4plK1B7dFMBHugwtfd2Ybo8lvQ=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jbrC221MSz4r5;
	Sat, 28 Nov 2026 01:05:18 +0100 (CET)
Message-ID: <61fa150d-732f-435f-8da6-4617e7b61f18@etik.com>
Date: Sat, 28 Nov 2026 01:05:17 +0100
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
From: gregoire.mureau+IT@etik.com
Content-Language: fr
To: linux-wireless@vger.kernel.org
Cc: burakgon12@gmail.com
Subject: Re: [PATCH] wifi: mac80211: deauthenticate from the old AP when
 roaming with MFP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: :f7146c1849a4b08:ham:1d76497143c010c
X-Infomaniak-Routing: alpha

Hi Burak,

same bug confirmed here on completely different hardware and a different 
trigger.

Client: Qualcomm WCN7850 (ath12k_wifi7_pci, PCI 17cb:1107), firmware 
WLAN.HMT.1.1.c7-00108, Ubuntu 26.04, kernel 7.2.6 (mainline build), 
wpa_supplicant 2.11, NetworkManager 1.54.3. AP: Mercusys BE9300, one AP 
MLD per band, MFP required.

Trigger: NetworkManager's default bgscan 'simple:30:-65:300' makes 
wpa_supplicant attempt a roam every ~300 s. On this setup the roam 
target it picks is the 6 GHz link of the same AP MLD, which never 
answers authentication, so every roam fails. With stock mac80211 the 
fallback to the old link then kept getting "reason 9" / "ASSOC-REJECT 
status 5" in a loop for 4-8 minutes until NetworkManager gave up and 
switched profiles.

Baseline (stock): 4/4 observed sessions dropped 305-308 s after 
CTRL-EVENT-CONNECTED, each time with the sequence "disconnect from AP 
for new auth to " -> auth timeouts -> reason 9 / status 5 loop -> 
SSID-TEMP-DISABLED -> profile switch. With bgscan disabled a session 
held 9+ hours with zero events.

With your patch applied on top of 7.2.6 and bgscan active again: 2/2 
roam cycles recovered instantly. The roam attempt still fails (the 6 GHz 
BSSID never answers), but the fallback to the old AP MLD is now accepted 
on the first try - auth, assoc, GTK, DHCP renew in about a second, same 
IP. A ~10 s blip instead of a 4-8 minute outage.

Tested-by: Grégoire MUREAU gregoire.mureau+IT@etik.com

Side note: the roam target selection itself also looks wrong here - the 
supplicant picks a BSSID that belongs to the current AP MLD (possibly a 
non-transmitted one) which can never answer. That is a separate issue, 
not something your patch is responsible for.

Regards,
Grégoire


