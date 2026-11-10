Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292465;
	b=tlrhHlAEfQcY6J2Kk/BkYYkk1Kt08E5XLT41+12/rLbIi4Tj8SyO6rhpxUa/h+9aB6sq
	 TCWpG+ACfUgqP+4npZIex2FrR0RYVNYG1fSKx3aeoXg8ntW4/k750BUiuO8UM/e4Y8MPr
	 ZdwAslHZ8YKkCV0kxInRBN3UaPvbmqwJWhvRBMxMlMdzAYwhzE9ZDiH6QCfHSh9XEAFBv
	 JXgA17dSmyIYpw+mWDxZraybZqYAeOLF93yNhP2Mk2AXpPPtSe+1PA+vXN18iNwGPmntm
	 ww1doCevjqsAKWFpPJiiOfuREcdifGQZCMMPcak19csPiXQkz14Iid8fSIla0/YWwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292465;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Bm/C7lotkynqC44+eXclXpFeP3C403t89cIv8d6OaKA=;
	b=0lUNfSB5jL7ZE0OPlGtte3zPqEd5Tx6RWM0toJu9tlGZts62o+i8EUKzqPXRGnI2ncYr
	 igT3G7+lJvnaTBGhD/TqxLeBzq0tTKF1+iSzv2TalURjoUpRDKG9khOOgJU1ZQH7p/kHa
	 Yb54ReRW9mM6yYnBCZBbHcxribsRam0M+q+5XZ3APIg8fDk+uAdTZO6rY+75jkur7u0eq
	 qc3cdsTBpxUIQPuy3j7t5dGD6DpcUguqSSkKQz+Ms0yIl0eQ422vVJ47i8kSQdgwZvaNT
	 eimm/vsRYBgT89mh/Vh8pSXBmihG04lEy0zWmN23ZXJ7OvWdaYEVmCCK4uLdvzmBYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=guwolf.com;
	spf=pass smtp.mailfrom=guwolf.com;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F81606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 06:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guwolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=guwolf.com
X-QQ-mid: zesmtpip3t1794292434t7d55d038
X-QQ-Originating-IP: MzC8s+QIhxeyhbRIKXE5VpWQzZn24VAB3LWIUuXBFyA=
Received: from [127.0.1.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 14:33:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15739772513078757284
From: Hao Tan <guwolf@guwolf.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject:
 Re: RTL8851BE: 5 GHz 80 MHz/HE beacon loss then auth timeout since 7.3
Date: Tue, 10 Nov 2026 14:33:52 +0800
Message-ID: <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
In-Reply-To: <340ed206ff6a4680a46806e3bea5dbc5@realtek.com>
References:
 <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com>
 <340ed206ff6a4680a46806e3bea5dbc5@realtek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:guwolf.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MYha8DeKTomkj/6LGQtONIxOS6t1Ugti7gyHgT+tUQzhUS/pXVcCKbQh
	egkfd4TqlvmhUKqdAfWUNTYJ+l4DsUj3p/glFX+Q081jKLj5ig0y7xsBKgPmA5Xd8rTmvFF
	r4J3YzZkjlwhFG+30SXjPaosds/j54AkYIb8H7WEl3ZAjTi2a0ZZoBWNMhEFViYRBVI+sIj
	wVDeLuNlkxlKRLuHCcRoz8r/9HN32myuzNOa96hzQJJpImqA//Yg/ansdgf3TD/yQQMH15m
	fR/1AkzlHlWY9KgFamsD4sORVI3hINaZSUxFezrYSMUm/blANMFdydtxH7mHAICVSQOuUZ0
	9K8IEW4mleHCY+FccchDXpm1q/O8RLlPwjxL3G4ChkwAMr8Uzo9h7SC5dRWnzyistFwyvF+
	2+mbTP0oJ7zGyTkZx0zIyL7nlu00CE+ba2oDKUahwvQ0wGUFewaRoV/mCuTILRE/IakRjQL
	h+HdugM6MSzAmO6UGuzfks0JFt33Ek0zZrht1ovN058iKQNvWuAAUJ4Jtm1hg8SEEHvivfX
	gJlUu3F785hQS8S7tERyTqSEGsA0XTklorf63e8iOnHuQgJ1K6hIFFblBIqyzgslG97oBbb
	Ij0SVdrLwXDBEubmIomoEAlxV3OP/P7uQoMALSH+NC7RIKkDveyrNZK3RR4gLFlniGzGY4b
	f7TRe8Ou05gSQb0Y/31Rz7FUKDjDEKAXr99Gizm1MvVvxoMconY80PcBVHOivkdGhobjlB4
	6QTlKcWAKIy0t4WiT1GXCId/dQTBOrdkxzVVvQWmmFjHSFgg6fGI82m97QZsQbZgG5Jv+7r
	mRZxzISYJt8V9QFs0n+EX0X6tQOEfrlzxu7ixAStltReZZpY1e8hftCcardpJs8XIvFDLb+
	We5ZHak6Q/Ga9VP+QOIpTav7k1WrsbH/zwlF69yu2VjGEpYy06s0BdeeojmpcVA/zEyOHen
	6TB2RE4qZGn3GiEn8SEm2/TeT6CSC5qv9MCuHdrphhkay+w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi Ping-Ke,

Thanks for the comments.

> The changes between 7.3.0 and 7.2.11 related to RTL8851BE are mostly
> BT-coexistence patches (if I read correctly), so you can quickly
> check if it works well with BT disabled.

This is a regression in v7.3. v7.2 is good and v7.3 is bad with the same
rtw8851b_fw-1.bin 0.29.41.5. I started from the v7.2 rtw89 driver and
applied the v7.3 rtw89 changes in order on one test kernel. The step that
changes the result is:

  86f763e37248 ("wifi: rtw89: coex: Rearrange _ntfy_role_info info") is good.

  a76501e1d148 ("wifi: rtw89: coex: Separate _ntfy_role_info into two functio=
n")
  is bad.

The rebuilt series differs from v7.3 by six files at the tail. Those
commits are after this step. Both endpoints were tested as unmodified
mainline, and the good/bad pair above differs by only a76501e1d148.

> if it is not too hard, please try to disable BT.

On unmodified v7.3, with the AP SSID "GuWolf" (BSSID 1e:40:e8:12:08:63):

  - Bluetooth controller powered off: VHT80 stayed up for 60 seconds,
    with no beacon loss. With the controller powered off,
    _set_wl_preagc_ctrl() already disables pre-AGC. pre_agc stayed 0
    for that run. The separate Bluetooth-on run reproduced the failure.
  - Bluetooth powered on: I used a temporary wpa_supplicant network and
    explicitly set disable_he=3D1 and disable_vht=3D0 before association.
    Both values remained set while it associated at VHT80; about three
    seconds later it disconnected with reason 4 (locally generated), and
    subsequent 5 GHz authentication timed out.

The beacon has HT and VHT IEs and no HE IE. VHT operation is 80 MHz
(channel 149, center 155). Forcing both disable_he=3D1 and disable_vht=3D1
falls back to HT20/HT40, which stays up.

> This is a little weird to me. RTL8851BE becomes idle (power off) after
> disconnection. It is very like reload modules. Not sure what they are
> different?

On unmodified v7.3 they are not the same. After the beacon loss I
disconnected and associated again without unloading the driver.
Association completed, but pre_agc was still 1, and beacons were lost
again after about one second. Reloading rtw89_8851be, rtw89_8851b,
rtw89_pci and rtw89_core clears that coex state and pre_agc returns to 0,
so one more association can complete before the same failure. RF idle
after disconnect does not clear it.

> What does UINT_MAX mean?

It is only the SSID of a second AP in the same room (BSSID
4e:69:b1:c6:62:64). It is 5 GHz only, WPA2-PSK, channel 149, and fails
the same way.

> Does it work if not disable_vht? (To clarify if RTL8851BE misbehavior
> on bandwidth 80MHz.)

No. With Bluetooth on, disable_he=3D1 and VHT still enabled, the VHT80
link still failed and disconnected with reason 4. See the second bullet
above.

a76501e1d148 also changes the role-notify flow, so I did not assume the
new STA value was the whole fix. This firmware uses role info v2
(fwlrole 2). Keeping the STA role and the new notify flow, but sending
link_mode_v0 in the role v2 H2C, still failed. Keeping the STA role, the
notify flow and the original H2C, and disabling pre-AGC when the link is
out of band, restored VHT80.

_set_wl_preagc_ctrl() disables pre-AGC when the TDD binding is 5 GHz, or
when the role is still NOLINK. Wi-Fi on 5 GHz and Bluetooth on 2.4 GHz
do not share a band, so tdd_bind is empty and out_of_band is already set.
After a76501e1d148 the NOLINK fallback no longer matches. The change is:

  } else if (dm->out_of_band ||
             dm->tdd_bind.rf_band =3D=3D BIT(RTW89_BAND_5G)) {
          is_preagc =3D BTC_PREAGC_DISABLE;

Overlapping TDD/FDD bindings are unchanged. I have tested this only on
RTL8851BE with 5 GHz Wi-Fi and 2.4 GHz Bluetooth.

On v7.3 the change passed 600 seconds at VHT80 with no beacon loss, then
five reconnects without unloading the module. Six 50 MB downloads and
three 10 MB uploads completed. The same change on rtw-next
04c9984187228904f222681661c50db3f0c50b71 passed that VHT80 test and a
separate 2.4 GHz association and traffic test.

I am not claiming continuous Bluetooth HID or PAN coexistence. The
keyboard did not reconnect after a controller toggle, and the PAN test
saw a transient disconnect. I will follow up with the change as a
separate [PATCH] in this thread.

Hao Tan
