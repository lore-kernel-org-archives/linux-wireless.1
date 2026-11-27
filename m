Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795795737;
	b=y2DJ5khTlMFPVXeqrhsvEblt32GNNXQ/Yl1K/Sd0pKXVYW3XYaGxlm2zZjR43zTz8yYO
	 iITicqnxMId84/lKKi+X7aaii8+R+CjybXMsVNjLctnNrBPy9Esef1HA+dnR8clN5q0ko
	 cLGZ1+xYYLD8echtlioMlerMycsv8GSEE+oQU7aMQcYy6IAFLoT7WLtPYgx4csqnGoJ56
	 3+4dL7S/3P25BG9qxYH5jSsDxeAWUXJ+lRqZIX4fctTs2KVymYUE4ebEZKJcWIKb1jKya
	 5TmpV3cnCeStfGeZ2UDL4yv/UEH/YF2AtNnKIiFHIY/h5DdhO1KqKAfbdc74QcMfMPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=rGjanWI+/NPRD05xibDNRNTywo7QqwnwFfPuRZby1+M=;
	b=BKxxIsW2uwEimmUqu5MPuKV5ygJQmSfbYXXEi8C6Ewmakb1u3s/dpEWd6obj+cKPVEN7
	 1RKjRxY13U2Pq9l/109QsgIjtE1MYgi78gfKd68ELkh/n5/DRmp4dpIiOD+8j6RF5vDQb
	 wvy8DBFj9iJDyH+WeHmpR7wKmN600yM+CT+aXV8A51L+IMtlD8z6kH2HbIAQ//pPhsDVk
	 sXckNjQUefy6/zaLKvVo3uaufNpu2illf78ymKZCwzpy0zLHrxnoNzT7B6cV/MQvLd0J7
	 smz+KwWklcWWr75jwh3/2etoh0j1eyDowPtPBroIoYWDBkroYTfgD/U8mUNTBmDT9Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uumXSACL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238E606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 16:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9238E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uumXSACL
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so3600424241.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795795736; cv=none;
        d=google.com; s=arc-20260327;
        b=fLPK9ol57BhKMPMQIZtq246i18Ua5ru5fzknHzVnrKsByRn296C+pPgFENys7CQvCu
         7hFIg7RAeyFSMUpLze6UPmyU2E/6c002YxXhXbC77rMpe+oy2BYYgkcCfuyDpGk1j9ps
         bXSH4N/hJ2/ewWDwzFtBBRi15HbyozGGQUw/tqzkrOY5poXSGDmwrf+35q3mG8SeuSsQ
         PL1odDfZTrmukvAj+bpC8iX8O+LTmwKwB1z2YTYsx/20XgFG01MYtvtm+UoFO7KpJycm
         vjKe5yaU3Pp6LPhboPEs5UWXqiL4b6nnFv7pwNN0Bq9/V2Ou2D7cW9j+ejeCk2Yy4T7p
         OA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rGjanWI+/NPRD05xibDNRNTywo7QqwnwFfPuRZby1+M=;
        fh=g4qIvl6/31HtnerxyVK37f4FNVcorEF6JuBH5wiMpis=;
        b=I55OyjtLF50/sGjzZcO6pkMyv5N058+sG+YJV2qm5dNoz5739m8Y6iVkcW5fgDS/1D
         cdX1kbuCkeV/WiuZ/9muN2ZFb2Wbz6KiRVmatcRw64X9xjNOkSWacxXDvnFwLs5BqqL5
         XKxgeJSBVFGT+WGENiwMhENKhV7k2eVeeWcDjB3A1suJVA6FgF0NPCD9+NdYZ6V4JYMr
         aNLq2SCged7yGCoxFCbu89aZ+kdAwJD5IH8FoYkFLWGxfv/19uDcwzwbL/WW7McHCmRd
         yJK6oCNQZ53+jbQtktucV3nUg0XXDkfnqTxYyxrO0/XWg+QiH3XaC6KGhkYTIx0K6RJn
         JAcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795795736; x=1796400536; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGjanWI+/NPRD05xibDNRNTywo7QqwnwFfPuRZby1+M=;
        b=uumXSACLnOLqMh1bVCcjPAqGNETEnOX3QFhzd+B51eIO9YzoVK+FJZRXpURYEM7YlY
         tZtA7ZtZFZMd4YV1GB50jW3WkRVAAcwiLj4q7NROEDX4UTNMHOkIfnxAir4C9iVi7cMz
         bMUv1fI9WiIb20cTLfG2NSOx1zM+Dq8Suu9QGmNqT1rotFdkBDkDRSnQDejqca0HHE+a
         DMJRf+yGXdXE9u5vq0vElvBP5J/etWzmcNDoHvFdoVf1NhQ7j660s4OFwjoMrzNvhbh3
         cMHXsPUmai7pulnnGNm9fMSq79zXgbuqnIQegUpfb6/PuForw7d21TPyVfjZ4W7urLYG
         vaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795736; x=1796400536;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rGjanWI+/NPRD05xibDNRNTywo7QqwnwFfPuRZby1+M=;
        b=rQ4ZaJA6Obeq6SYqO+rVHeNZmVZhbzKSOfQNDsYsKorm1WlHDQWS9J4cO3u1Q3IzEW
         +cCDLx0bOpb1MJZsq/ZpDDltzHRYNsstGIKUfcSTKKAA2VlhfQQi7tSJKLegUIHbrPjJ
         LTZWATK8UeoGr0q0dP0O6XHu7kXMLuBDKT9+KpHzY+HETMfJlk7bDKgpCQjASxTQPmnl
         UjXe8JGZFKGClqvtDenr4ouQYkEq3NsLIQhOX01k/o18yoy4dKJp+YuERdXJo9ymhsyg
         Y9swVxYuD1Uzd3mMzjJB2jCuK5gk4Lq5vkMLmGly8p2v2MXi5FZTsWDSuBFvrsowkAvc
         +uEw==
X-Gm-Message-State: APuU4Z+0E2UOu5GbufnMfiFIeMpX2I7p7KiULx9kkaJqY8ArbZXEI9F1
	lk9siQVR+SO3KSh5k45TJ3VCKkCO1I6hu9JIWmut4xqsaBG4BGwC8NqLC/Fk6Jo8HL/+tJ0LMPF
	/HAoG2f8mgOHpZ/+/BOkOz/F+JvpLXY0=
X-Gm-Gg: AZFdTZdTe18rqOGYAFgvEYMn019JrAKSim0t7mBwoImtHUz4YDMvs4bHpUKFyUbQUTD
	pYuq6owza+SOaU5GNxH1AsinLNWYNV5xjsMd1PFP3M5P0ugWFkbkFpu3sE9Kva9eJB2RIceAqJe
	qY5PF7PztTtn/PcBhuoZSTrwRdB5pl2GAMCFQt9h9+9MhGoQOdzOHdHHzBRhuPnsdMfLIlPylxE
	MDwhJpB4HjW35A/1JMDmFgJGbr+wRI8Y6Bmsok2yg7zi3z2VaPXQy1PVCFcwRWpP7maOlDcx8JR
	2I4Md1BXqnJ0zkKpzhCH+zwrNNQ/9sGOT67ooBDKgRqiHfwvjrqJuYL10mRuRaakGphQ93+v0bM
	dRPkvJiITu39QgbDGJ6dHNB11OXnJbRGpZczlyT4h3t5EtcFwBtLScWw3bDQmHSCG0MJR53/8uv
	tbeQ8MoSP0Ve2uhoT50+MkA5RzTNv/ZRN9+TeKHUWDlYtgNXbNmuK/
X-Received: by 2002:a67:e706:0:b0:7cc:32ce:4c5e with SMTP id
 ada2fe7eead31-7d739424c09mr14630365137.16.1795795736346; Fri, 27 Nov 2026
 08:08:56 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lucca Moura <luccazoppi@gmail.com>
Date: Fri, 27 Nov 2026 17:08:19 +0100
X-Gm-Features: Aa3M54qtbeDMzwxzI67ZSX4IbfCLw3sDucN1eNJSelcfiMFZw3nW0OtG1btVrHo
Message-ID: <CAJC97KHAQ6dgm+n_2sF_ypwfe6HsYupd-BOtz9m=LFROg3sfYQ@mail.gmail.com>
Subject: wifi: rtw89: beacon filter NOTIFY reported as CQM RSSI HIGH at -110 dBm
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On an RTL8852BE-VT, rtw89 sends CQM RSSI HIGH events with a level of
-110 dBm while the actual signal is about -60 dBm. iwd acts on the
level and starts roaming.

- RTL8852BE-VT [10ec:b520], driver rtw89_8852bte
- Firmware 0.29.122.2, Linux 7.3.5 (Arch), iwd 3.12

rtw89_mac_bcn_fltr_rpt() maps RTW89_BCN_FLTR_NOTIFY to
NL80211_CQM_RSSI_THRESHOLD_EVENT_HIGH with sig = MA - MAX_RSSI. In
NOTIFY reports from this firmware MA is 0, so the level is -110.

Log with debug_mask=0x1000:

00:10:47.241 iwd: Signal change event (above=1 signal=-110)
00:10:47.242 kernel: C2H bcnfltr rpt macid: 0, type: 2, ma: -110, event: 0
00:10:51.281 iwd: Signal change event (above=1 signal=-110)
00:10:51.282 kernel: C2H bcnfltr rpt macid: 0, type: 2, ma: -110, event: 0

Each iwd event matches one NOTIFY report. The station signal at the
time was -59..-67 dBm. On this network the resulting roams often fail
and cause short outages.

Perhaps NOTIFY reports should not be passed to
ieee80211_cqm_rssi_notify(), but I do not know what NOTIFY means in
the firmware.

I can test patches.

Thanks,
Lucca
